
python do_build_secondary() {

  import subprocess

  def subprocess_oneliner(command):
    process = subprocess.Popen(command,stdout=subprocess.PIPE, shell=True)
    out = process.communicate()
    return out

  SETUP_SCRIPT="setup-environment"

  TMPDIR = os.path.abspath(os.path.dirname(d.getVar('TMPDIR', True)))

  machine = d.getVar("SECOND_BUILD_MACHINE", "")
  distro = d.getVar("DISTRO", "")
  oeroot = d.getVar("OEROOT", "")
  secondaryImage = d.getVar("SECOND_BUILD_IMAGE", "")
  file = d.getVar("FILE","")

  setup_script_full_path = os.path.join(oeroot, SETUP_SCRIPT)
  secondary_build_dir = os.path.join("secondary_build")

  command = 'bash -c "cd %s && MACHINE=%s DISTRO=%s source %s %s && echo  && bitbake %s " ' % (oeroot, machine, distro, SETUP_SCRIPT, secondary_build_dir, secondaryImage)
  output = subprocess_oneliner(command)

}

