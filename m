From: Gini <gheorghe.coserea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [BUG] man proc - missing /proc/sys/kernel/sysrq
Date: Wed, 11 Feb 2009 16:18:14 +0200
Message-ID: <70c398100902110618r104b4e01l1cdb879ddd41af3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,
The following bug is present in proc manpage (man proc):
- the /proc/sys/kernel/sysrq entry is missing.

Proper documentation about this can be found in linux kernel source
tree in "Documentation/sysrq.txt" file.
--------------------------------------------------------------------
$ dpkg -s manpages
Package: manpages
Status: install ok installed
Priority: important
Section: doc
Installed-Size: 1012
Maintainer: Martin Schulze <joey-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Architecture: all
Version: 3.14-1
Replaces: bind, rsh-server (<< 0.10-7)
Suggests: man-browser
Description: Manual pages about using a GNU/Linux system
 This package contains GNU/Linux manual pages for these sections:
  4 = Devices (e.g. hd, sd).
  5 = File formats and protocols, syntaxes of several system
      files (e.g. wtmp, /etc/passwd, nfs).
  7 = Conventions and standards, macro packages, etc.
      (e.g. nroff, ascii).
 .
 Sections 1, 6 and 8 are provided by the respective applications. This
 package only includes the intro man page describing the section.
 .
 The man pages describe syntaxes of several system files.
--------------------------------------------------------------------
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
