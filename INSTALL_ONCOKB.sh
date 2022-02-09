#
# Setup a virtual environment and install
# oncokb-annotator into it
#

python3 -m venv venv.oncokb
. venv.oncokb/bin/activate
pip install --upgrade pip
pip install -r oncokb-annotator/requirements/common.txt -r oncokb-annotator/requirements/pip3.txt 
deactivate 
