From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] boot.7: Copy editing and update
Date: Thu, 12 Mar 2015 15:00:24 -0000
Message-ID: <892a44c6ff3d40b79ca3121c3290fae0-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The patches are as follows:

  boot.7: Copy edit
  boot.7: Mention `systemd(1)' and its related `bootup(7)'

   man7/boot.7 | 253 ++++++++++++++++++++++++++++++++----------------------------
   1 file changed, 137 insertions(+), 116 deletions(-)

The following is the collective patch; it's probably best just
to read the result directly via `man'.

Sincerely,
Michael Witten

diff --git a/man7/boot.7 b/man7/boot.7
index 584c771..4541b8c 100644
--- a/man7/boot.7
+++ b/man7/boot.7
@@ -12,194 +12,215 @@
 .\"
 .\" Modified 2004-11-03 patch from Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
 .\"
-.TH BOOT 7 2010-09-19 "Linux" "Linux Programmer's Manual"
+.TH BOOT 7 2015-03-11 "Linux" "Linux Programmer's Manual"
 .SH NAME
-boot-scripts \- general description of boot sequence
+boot \- System bootup process based on UNIX System V Release 4
 .SH DESCRIPTION
 .LP
-The boot sequence varies in details among systems
-but can be roughly divided to the following steps:
-(i) hardware boot, (ii) operating system (OS) loader,
-(iii) kernel startup, (iv) init and inittab,
-(v) boot scripts.
-We will describe each of these in more detail below.
-.SS Hardware-boot
+The \fBbootup process\fR (or "\fBboot sequence\fR") varies in details
+among systems, but can be roughly divided into phases controlled by
+the following components:
+.IP 1. 4
+hardware
+.IP 2. 4
+operating system (OS) loader
+.IP 3. 4
+kernel
+.IP 4. 4
+root user-space process (\fIinit\fR and \fIinittab\fR)
+.IP 5. 4
+boot scripts
+.PP
+Each of these is described below in more detail.
+.SS Hardware
 After power-on or hard reset, control is given
-to a program stored on read-only memory (normally
-PROM).
-In PC we usually call this program the \fBBIOS\fR.
+to a program stored in read-only memory (normally
+PROM); for historical reasons involving the personal
+computer, this program is often called "the \fBBIOS\fR".
 
-This program normally makes a basic self-test of the
+This program normally performs a basic self-test of the
 machine and accesses nonvolatile memory to read
 further parameters.
 This memory in the PC is
 battery-backed CMOS memory, so most people
-refer to it as the \fBCMOS\fR, although outside
-of the PC world, it is usually called \fBnvram\fR
-(nonvolatile ram).
+refer to it as "the \fBCMOS\fR"; outside
+of the PC world, it is usually called "the \fBNVRAM\fR"
+(nonvolatile RAM).
 
-The parameters stored in the nvram vary between
-systems, but as a minimum, the hardware boot program
-should know what is the boot device, or which devices
-to probe as possible boot devices.
-
-Then the hardware boot stage accesses the boot device,
-loads the OS loader, which is located on a fixed position
-on the boot device, and transfers control to it.
+The parameters stored in the NVRAM vary among
+systems, but as a minimum, they should specify
+which device can supply an OS loader, or at least which
+devices may be probed for one; such a device is known as "the
+\fBboot device\fR".
+The hardware boot stage loads the OS loader from a fixed position on
+the boot device, and then transfers control to it.
 .TP
 Note:
-We do not cover here booting from network.
-Those who want
-to investigate this subject may want to research:
-DHCP, TFTP, PXE, Etherboot.
+The device from which the OS loader is read may be attached via a network, in which
+case the details of booting are further specified by protocols such as
+DHCP, TFTP, PXE, Etherboot, etc.
 .SS OS loader
-In PC, the OS loader is located in the first sector
-of the boot device \- this is the \fBMBR\fR
+The main job of the OS loader is to locate the kernel
+on some device, load it, and run it.
+Most OS loaders allow
+interactive use, in order to enable specification of an alternative
+kernel (maybe a backup in case the one last compiled
+isn't functioning) and to pass optional parameters
+to the kernel.
+
+In a traditional PC, the OS loader is located in the initial 512-byte block
+of the boot device; this block is known as "the \fBMBR\fR"
 (Master Boot Record).
 
-In most systems, this primary loader is very
+In most systems, the OS loader is very
 limited due to various constraints.
-Even on non-PC systems
-there are some limitations to the size and complexity
+Even on non-PC systems,
+there are some limitations on the size and complexity
 of this loader, but the size limitation of the PC MBR
-(512 bytes including the partition table) makes it
-almost impossible to squeeze a full OS loader into it.
+(512 bytes, including the partition table) makes it
+almost impossible to squeeze much functionality into it.
 
-Therefore, most operating systems make the primary loader
-call a secondary OS loader which may be located on
-a specified disk partition.
+Therefore, most systems split the role of loading the OS between
+a primary OS loader and a secondary OS loader; this secondary
+OS loader may be located within a larger portion of persistent
+storage, such as a disk partition.
 
-In Linux the OS loader is normally
+In Linux, the OS loader is often either
 .BR lilo (8)
 or
 .BR grub (8).
-Both of them may install either as secondary loaders
-(where the DOS installed MBR points to them), or
-as a two part loader where they provide special MBR
-containing the bootstrap code to load the second part
-of the loader from the root partition.
-
-The main job of the OS loader is to locate the kernel
-on the disk, load it and run it.
-Most OS loaders allow
-interactive use, to enable specification of alternative
-kernel (maybe a backup in case the last compiled one
-isn't functioning) and to pass optional parameters
-to the kernel.
-.SS Kernel startup
-When the kernel is loaded, it initializes the devices (via
-their drivers), starts the swapper (it is a "kernel process",
-called kswapd in modern Linux kernels), and mounts the root
-filesystem (/).
+.SS Kernel
+When the kernel is loaded, it initializes various components of
+the computer and operating system; each portion of software
+responsible for such a task is usually consider "a \fBdriver\fR" for
+the applicable component. The kernel starts the virtual memory
+swapper (it is a kernel process, called "kswapd" in a modern Linux
+kernel), and mounts some filesystem at the root path,
+.IR / .
 
 Some of the parameters that may be passed to the kernel
-relate to these activities (e.g: You can override the
-default root filesystem).
-For further information
-on Linux kernel parameters read
+relate to these activities (for example, the default root filesystem
+can be overriden); for further information
+on Linux kernel parameters, read
 .BR bootparam (7).
 
-Only then the kernel creates the first (user land)
-process which is numbered 1.
-This process executes the
+Only then does the kernel create the initial userland
+process, which is given the number 1 as its
+.B PID
+(process ID).
+Traditionally, this process executes the
 program
 .IR /sbin/init ,
-passing any parameters that weren't handled by the kernel already.
-.SS init and inittab
-When init starts it reads
+to which are passed the parameters that haven't already been
+handled by the kernel.
+.SS Root user-space process
+.TP
+Note:
+The following description applies to an OS based on UNIX System V Release 4.
+Namely, a number of widely used systems have adopted a related but
+fundamentally alternative approach known as
+.BR systemd (1),
+for which the bootup process is detailed in its associated
+.BR bootup (7).
+.LP
+When
+.I /sbin/init
+starts, it reads
 .I /etc/inittab
 for further instructions.
-This file defines what should be run in different \fIrun-levels\fR.
+This file defines what should be run when the
+.I /sbin/init
+program is instructed to enter a particular \fIrun-level\fR, giving
+the administrator an easy way to establish an environment
+for some usage; each run-level is associated with a set of services
+(for example, run-level \fBS\fR is \fIsingle-user\fR mode,
+and run-level \fB2\fR entails running most network services).
 
-This gives the system administrator an easy management scheme, where
-each run-level is associated with a set of services (e.g,
-\fBS\fR is \fIsingle-user\fR, on \fB2\fR most network
-services start).
 The administrator may change the current
 run-level via
-.BR init (1)
+.BR init (1),
 and query the current run-level via
 .BR runlevel (8).
 
 However, since it is not convenient to manage individual services
-by editing this file, inittab only bootstraps a set of scripts
+by editing this file,
+.I /etc/inittab
+only bootstraps a set of scripts
 that actually start/stop the individual services.
 .SS Boot scripts
 .TP
 Note:
-The following description applies to System V release 4-based systems, which
-currently covers most commercial UNIX systems (Solaris, HP-UX, Irix, Tru64)
-as well as the major Linux distributions (Red Hat, Debian, Mandriva,
-SUSE, Ubuntu).
-Some systems (Slackware Linux, FreeBSD, OpenBSD)
-have a somewhat different scheme of boot scripts.
+The following description applies to an OS based on UNIX System V Release 4.
+Namely, a number of widely used systems (Slackware Linux, FreeBSD, OpenBSD)
+have a somewhat different scheme for boot scripts.
 .LP
-For each managed service (mail, nfs server, cron, etc.) there is
+For each managed service (mail, nfs server, cron, etc.), there is
 a single startup script located in a specific directory
 .RI ( /etc/init.d
 in most versions of Linux).
 Each of these scripts accepts as a single argument
-the word "start" \-\- causing it to start the service, or the word
-\&"stop" \-\- causing it to stop the service.
+the word "start" (causing it to start the service) or the word
+\&"stop" (causing it to stop the service).
 The script may optionally
-accept other "convenience" parameters (e.g: "restart", to stop and then
-start, "status" to display the service status).
+accept other "convenience" parameters (e.g,. "restart" to stop and then
+start, "status" to display the service status, etc.).
 Running the script
 without parameters displays the possible arguments.
 .SS Sequencing directories
-To make specific scripts start/stop at specific run-levels and in
-specific order, there are \fIsequencing directories\fR.
-These
-are normally in \fI/etc/rc[0\-6S].d\fR.
-In each of these directories
+To make specific scripts start/stop at specific run-levels and in a
+specific order, there are \fIsequencing directories\fR, normally
+of the form  \fI/etc/rc[0\-6S].d\fR.
+In each of these directories,
 there are links (usually symbolic) to the scripts in the \fI/etc/init.d\fR
 directory.
 
 A primary script (usually \fI/etc/rc\fR) is called from
-.BR inittab (5)
-and calls the services scripts via the links in the sequencing directories.
-All links with names that begin with \(aqS\(aq are being called with
+.BR inittab (5);
+this primary script calls each service's script via a link in the
+relevant sequencing directory.
+Each link whose name begins with \(aqS\(aq is called with
 the argument "start" (thereby starting the service).
-All links with
-names that begin with \(aqK\(aq are being called with the argument "stop"
-(thereby stopping the service).
+Each link whose name begins with \(aqK\(aq is called with
+the argument "stop" (thereby stopping the service).
 
 To define the starting or stopping order within the same run-level,
-the names of the links contain order-numbers.
-Also, to make the names clearer, they usually
-end with the name of the service they refer to.
-Example:
+the name of a link contains an \fBorder-number\fR.
+Also, for clarity, the name of a link usually
+ends with the name of the service to which it refers.
+For example,
 the link \fI/etc/rc2.d/S80sendmail\fR starts the sendmail service on
 runlevel 2.
 This happens after \fI/etc/rc2.d/S12syslog\fR is run
 but before \fI/etc/rc2.d/S90xfs\fR is run.
 
-To manage the boot order and run-levels, we have to manage these links.
-However, on many versions of Linux, there are tools to help with this task
-(e.g:
+To manage these links is to manage the boot order and run-levels;
+under many systems, there are tools to help with this task
+(e.g.,
 .BR chkconfig (8)).
 .SS Boot configuration
-Usually the daemons started may optionally receive command-line options
+A program that provides a service is often called a "\fBdaemon\fR".
+Usually, a daemon may receive various command-line options
 and parameters.
-To allow system administrators to change these
-parameters without editing the boot scripts themselves,
-configuration files are used.
-These are located in a specific
-directory (\fI/etc/sysconfig\fR on Red Hat systems) and are
-used by the boot scripts.
+To allow a system administrator to change these
+inputs without editing an entire boot script,
+some separate configuration file is used, and is located in a specific
+directory where an associated boot script may find it
+(\fI/etc/sysconfig\fR on older Red Hat systems).
 
-In older UNIX systems, these files contained the actual command line
-options for the daemons, but in modern Linux systems (and also
-in HP-UX), these files just contain shell variables.
-The boot scripts in \fI/etc/init.d\fR
-\fBsource\fR the configuration
-files, and then use the variable values.
+In older UNIX systems, such a file contained the actual command line
+options for a daemon, but in modern Linux systems (and also
+in HP-UX), it just contains shell variables.
+A boot script in \fI/etc/init.d\fR reads and includes its configuration
+file (that is, it "\fBsources\fR" its configuration file) and then uses
+the variable values.
 .SH FILES
 .LP
 .IR /etc/init.d/ ,
 .IR /etc/rc[S0\-6].d/ ,
 .I /etc/sysconfig/
 .SH SEE ALSO
+.BR bootup (7)
+.BR systemd (1)
 .BR inittab (5),
 .BR bootparam (7),
 .BR init (1),

-- 
1.7.11.2.252.gc4a64c8

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
