
match WarningMsg '\%>100v.\+' " Show long lines





iabbrev ifmain if __name__ == '__main__':
iabbrev pdb import pdb; pdb.set_trace() #TODO Take out
iabbrev pudb import pudb; pudb.set_trace() #TODO Take out
iabbrev bpdb import bpdb; bpdb.set_trace() #TODO Take out
iabbrev ipdb import ipdb; ipdb.set_trace() #TODO Take out
iabbrev rpdb from remote_pdb import RemotePdb;RemotePdb('0.0.0.0', 4444).set_trace() #TODO Take out
iabbrev inspectframes  import inspect;frames=[x[1:] for x in inspect.getouterframes(inspect.currentframe())];for f in frames: print f;pass #TODO takeout
iabbrev sefl self
iabbrev slef self
iabbrev __inti__ __init__
iabbrev NOne None
iabbrev tempalte template
iabbrev codeeval import sys<CR><CR>with open(sys.argv[1], 'r') as open_file:<CR>for test in open_file:<CR>test = test.strip()<CR>if test:
iabbrev withopen with open(file_path, 'r') as opened_file:
