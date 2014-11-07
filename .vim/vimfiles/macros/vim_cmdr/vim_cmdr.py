################################################################################
#
# file:     vim_cmdr.py
# purpose:  implements a "Norton Commander" style filemanager within vim
#
# author:   brian m sturk   bsturk@adelphia.net,
#                           http://users.adelphia.net/~bsturk
# created:  06/03/03
# last_mod: 
# version:  0.01a
#
# usage, etc:   see vim_cmdr.readme
# history:      see ChangeLog
# in the works: see TODO
#
###############################################################################

import vim, sys, re, os

##  If you're having a issue running vim_commander, please change 
##  the 0 to a 1 below and send me an email of the output.

_DEBUG_ = 0

################################################################################
##                             class vim_cmdr_panel                           ##
################################################################################

class vim_cmdr_panel:

    CWD_LINE_NUM  = 0

################################################################################

    def __init__( self, buf_name ):

        try:

            self.buffer_name = buf_name

            for b in vim.buffers:

                match = buf_name + '$'
                name  = b.name

                if name != None:
                    if re.search( match, name ):
                        self.buffer = b

            for w in vim.windows:
                if w != None:
                    if w.buffer == self.buffer:
                        self.window = w

            dbg_print( 'Creating panel for buffer ' + self.buffer_name )

            ##  TODO: Allow saving cwd of each panel in session

            self.cwd = os.getcwd()

        except:

            dbg_exception( '__init__(): exception!' )

################################################################################

    def set_current( self, is_current ):

        self.is_current = is_current

################################################################################

    def populate_panel( self ):

        self.do_hdr( )
        self.buffer.append( '' )
        self.do_entries( )

################################################################################

    def refresh( self ):

        print 'refreshing'
        self.populate_panel()

################################################################################

    def do_hdr( self ):

        try:

            win_h = self.window.height
            win_w = self.window.width

            dbg_print( 'window height is ' + str( win_h ) )
            dbg_print(' window width  is ' + str( win_w ) )

            ##  TODO: Should I be using this??
            #vim.command( 'let pwd = getcwd()' )
            #pwd = vim.eval( 'pwd' )

            horiz   = ' '
            leader  = '<- '
            trailer = ' ->'

            if self.is_current:
                leader  = '<+ '
                trailer = ' +>'

            num_to_fill = win_w - ( len( leader ) + len( trailer ) + len( self.cwd ) )

            ##  TODO:  Allow left/right justification here
            ##  TODO:  Truncate directory based on cfg option

            if num_to_fill > 0:
                line = leader + self.cwd + ( num_to_fill * horiz ) + trailer

            else:
                line = leader + self.cwd + trailer

            self.buffer[ self.CWD_LINE_NUM ] = line 

        except:

            dbg_exception( 'do_hdr(): exception!' )
            
################################################################################

    def do_entries( self ):

        try:

            entries = os.listdir( self.cwd )

            for entry in entries:
                self.buffer.append( entry )

        except:

            dbg_exception( 'do_entries(): exception!' )

################################################################################
##                             class vim_cmdr                                 ##
################################################################################

class vim_cmdr:

    def __init__( self ):

        self.new_session( )
        self.panel_a       = None
        self.panel_b       = None
        self.current_panel = None

################################################################################

    def sigint_handler( self, sig, frame ):

        dbg_print( 'sigint_handler(): caught SIGINT' )
        dbg_print( '' )

################################################################################

    def new_session( self ):

	vim.command( 'filetype on' )

        filename_pri = '-panel_a-'
        filename_alt = '-panel_b-'

        try:

            vim.command( 'silent new ' + filename_alt )
            vim.command( 'setfiletype vim_commander' )

            #vim.command( 'set splitright' )                   ##  TODO: support splitbelow

            vim.command( 'silent vsplit ' + filename_pri )
            vim.command( 'setfiletype vim_commander' )

            self.panel_a = vim_cmdr_panel( filename_pri )
            self.panel_b = vim_cmdr_panel( filename_alt )

            self.panel_a.set_current( 1 )
            self.panel_b.set_current( 0 )

            self.panel_a.populate_panel( )
            self.panel_b.populate_panel( )

            self.current_panel = panel_a

        except:

            dbg_exception( 'new_session(): exception!' )

################################################################################

    def switch_panels():

        if cmdr.current_panel == cmdr.panel_a:
            cmdr.current_panel = cmdr.panel_b

            cmdr.panel_a.set_current( 0 )
            cmdr.panel_b.set_current( 1 )

            cmdr.panel_a.refresh()
            cmdr.panel_b.refresh()

################################################################################
##                           Helper functions                                 ##
################################################################################
        
def test_and_set( vim_var, default_val ):

    ret = default_val

    vim.command( 'let dummy = exists( "' + vim_var + '" )' )
    exists = vim.eval( "dummy" )

    ##  exists will always be a string representation of the evaluation

    if exists != '0':
        ret = vim.eval( vim_var )
        dbg_print( 'test_and_set(): variable ' + vim_var + ' exists, using supplied ' + ret )

    else:
        dbg_print( 'test_and_set(): variable ' + vim_var + ' doesn\'t exist, using default ' + ret )

    return ret

################################################################################

def dump_str_as_hex( _str ):

    hex_str = ''

    print 'length of string is ' + str( len( _str ) )

    for x in range( 0, len( _str ) ):
        hex_str = hex_str + hex( ord( _str[x] ) ) + "\n"

    print 'raw line ( hex ) is:'
    print hex_str

################################################################################

def dbg_print( _str ):

    if _DEBUG_:
        print _str
 
################################################################################

def dbg_exception( _str ):

    if _DEBUG_:
         print _str + ' ' + str( sys.exc_info( )[0] ) + str( sys.exc_info( )[1] )

################################################################################
##                           Main execution code                              ##
################################################################################

dbg_print( 'main(): in main execution code' )

cmdr = None

try:
    cmdr = vim_cmdr()

except:
    dbg_print( 'main(): exception! ' + str( sys.exc_info( )[0] ) )
