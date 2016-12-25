if not exist angr git clone https://github.com/angr/angr.git || goto :error
if not exist simuvex git clone https://github.com/angr/simuvex.git || goto :error
if not exist claripy git clone https://github.com/angr/claripy.git || goto :error
if not exist cle git clone https://github.com/angr/cle.git || goto :error
if not exist pyvex git clone https://github.com/angr/pyvex.git || goto :error
if not exist vex git clone https://github.com/angr/vex.git || goto :error
if not exist archinfo git clone https://github.com/angr/archinfo.git || goto :error
if not exist capstone git clone https://github.com/angr/capstone.git || goto :error
if not exist angr-doc git clone https://github.com/angr/angr-doc.git || goto :error
if not exist binaries git clone https://github.com/angr/binaries.git || goto :error

if ("%1" == "") goto :nocheckout
call git_all.bat checkout %1
:nocheckout

pip install -e .\capstone || goto :error
pip install -e .\archinfo || goto :error
pip install -e .\pyvex || goto :error
pip install -e .\cle || goto :error
pip install -e .\claripy || goto :error
pip install -e .\simuvex || goto :error
pip install -e .\angr || goto :error

pip install nose monkeyhex ipdb || goto :error

echo "Developement install success!"
exit /b 0

:error
echo "Developement install failed!"
exit /b 1