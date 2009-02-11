From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [BUG] man proc - missing /proc/sys/kernel/sysrq
Date: Thu, 12 Feb 2009 08:59:46 +1300
Message-ID: <cfd18e0f0902111159j2b49e851pf66bd4f764778d9@mail.gmail.com>
References: <70c398100902110611n6da69f31j6def10b72b58ab28@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <70c398100902110611n6da69f31j6def10b72b58ab28-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gini <gheorghe.coserea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joey-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Thu, Feb 12, 2009 at 3:11 AM, Gini <gheorghe.coserea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
> The following bug is present in proc manpage (man proc):
> - the /proc/sys/kernel/sysrq entry is missing.
>
> Proper documentation about this can be found in linux kernel source tree in
> "Documentation/sysrq.txt" file.
> --------------------------------------------------------------------
> $ dpkg -s manpages
> Package: manpages
> Status: install ok installed
> Priority: important
> Section: doc
> Installed-Size: 1012
> Maintainer: Martin Schulze <joey-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> Architecture: all
> Version: 3.14-1
> Replaces: bind, rsh-server (<< 0.10-7)
> Suggests: man-browser
> Description: Manual pages about using a GNU/Linux system
>  This package contains GNU/Linux manual pages for these sections:
>   4 = Devices (e.g. hd, sd).
>   5 = File formats and protocols, syntaxes of several system
>       files (e.g. wtmp, /etc/passwd, nfs).
>   7 = Conventions and standards, macro packages, etc.
>       (e.g. nroff, ascii).
>  .
>  Sections 1, 6 and 8 are provided by the respective applications. This
>  package only includes the intro man page describing the section.
>  .
>  The man pages describe syntaxes of several system files.
> --------------------------------------------------------------------

Thanks for the report.  For man-pages-3.19, I applied the patch below,
which mostly draws text from Documentation/sysrq.txt.

(From my point of view as upstream maintainer, it isn't needed to now
write a Debian report, although I would have also picked up the report
if you had written it there.)

Cheers,

Michael

diff --git a/man5/proc.5 b/man5/proc.5
index 6c8abde..a6975dd 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2291,6 +2291,33 @@ This file
 specifies the system-wide maximum number of System V shared memory
 segments that can be created.
 .TP
+.I /proc/sys/kernel/sysrq
+This file controls the functions allowed to be invoked by the SysRq key.
+By default,
+the file contains 1 meaning that every possible SysRq request is allowed
+(in older kernel versionsm, SysRq was disabled by default,
+and you were required to specifically enable it at run-time,
+but this is not the case any more).
+Possible values in this file are:
+
+   0 - disable sysrq completely
+   1 - enable all functions of sysrq
+  >1 - bitmask of allowed sysrq functions, as follows:
+          2 - enable control of console logging level
+          4 - enable control of keyboard (SAK, unraw)
+          8 - enable debugging dumps of processes etc.
+         16 - enable sync command
+         32 - enable remount read-only
+         64 - enable signalling of processes (term, kill, oom-kill)
+        128 - allow reboot/poweroff
+        256 - allow nicing of all real-time tasks
+
+This file is only present if the
+.B CONFIG_MAGIG_SYSRQ
+kernel configuration option is enabled.
+For further details see the kernel source file
+.IR Documentation/sysrq.txt .
+.TP
 .I /proc/sys/kernel/version
 This file contains a string like:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
