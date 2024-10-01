.. _host-os-hardening.rst:

Host OS Hardening
#################

When |C| is running in a container or a virtual machine, the host OS must
perform necessary security hardening and customization to make sure it can
be treated as the :abbr:`TCB (Trusted Computing Base)` of |C|. We recommend
you harden the OS from the below side (not limited):

1. OS integrity protection

   a. **Enable secure boot**. To ensure starting verification from the
      hardware
      back root of trust from the :abbr:`TPM (Trusted Platform Module)` and
      go all the way up to the system kernel.
   b. **User space file protection**. The host OS should leverage DM-verity,
      IMA/EVM, or any other solution to ensure the user space system file
      integrity to avoid a broken trust boot chain to Android\*.
   c. **Malicious software prevention**. The host OS should provide a
      solution to prevent installation of any malicious software that could
      break the verified boot chain and prevent a performance run-time
      attack on the VM/container.

2. Data encryption: TPM-backed :abbr:`FDE (Full Disk Encryption)` or
   :abbr:`FBE (File-Based Encryption)`. Hardware-backed data encryption is
   required to protect the host data file confidentiality of the VM and
   container.
3. Access control. Both DAC and MAC solution are required to protect the
   isolation of the VM and container. SELinux is used to harden the access
   to critical files. Some host operating systems don’t support SELinux. In
   this case, use AppArmor\* or other equivalent technology.
