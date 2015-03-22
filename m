From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] hier.7: Add missing directories defined by FHS 2.3
 (last patch for conformance)
Date: Sun, 22 Mar 2015 16:52:14 +0100
Message-ID: <550EE52E.8080906@gmail.com>
References: <1426374917-11484-1-git-send-email-saulery@free.fr> <1426374917-11484-5-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426374917-11484-5-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 12:15 AM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael

> ---
>  man7/hier.7 | 118 ++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 118 insertions(+)
>=20
> diff --git a/man7/hier.7 b/man7/hier.7
> index 70ada3c..77f365c 100644
> --- a/man7/hier.7
> +++ b/man7/hier.7
> @@ -98,9 +98,38 @@ depends on local administration decisions (optiona=
l).
>  This directory should hold those shared libraries that are necessary
>  to boot the system and to run the commands in the root filesystem.
>  .TP
> +.I /lib<qual>
> +These directories are variants of
> +.I /lib
> +on system which support more than one binary format requiring separa=
te
> +libraries (optional).
> +.TP
> +.I /lib/modules
> +Loadable kernel modules (optional).
> +.TP
>  .I /media
>  This directory contains mount points for removable media such as CD
>  and DVD disks or USB sticks.
> +On systems where more than one device exists
> +for mounting a certain type of media,
> +mount directories can be created by appending a digit
> +to the name of those available above starting with '0',
> +but the unqualified name must also exist.
> +.TP
> +.I /media/floppy[1\-9]
> +Floppy drive (optional).
> +.TP
> +.I /media/cdrom[1\-9]
> +CD-ROM drive (optional).
> +.TP
> +.I /media/cdrecorder[1\-9]
> +CD writer (optional).
> +.TP
> +.I /media/zip[1\-9]
> +Zip drive (optional).
> +.TP
> +.I /media/usp[1\-9]
> +USB drive (optional).
>  .TP
>  .I /mnt
>  This directory is a mount point for a temporarily mounted filesystem=
=2E
> @@ -173,6 +202,9 @@ executed by normal users which are not needed for=
 booting or for
>  repairing the system and which are not installed locally should be
>  placed in this directory.
>  .TP
> +.I /usr/bin/mh
> +Commands for the MH mail handling system (optional).
> +.TP
>  .I /usr/bin/X11
>  is the traditional place to look for X11 executables; on Linux, it
>  usually is a symbolic link to
> @@ -204,6 +236,9 @@ Binaries for games and educational programs (opti=
onal).
>  .I /usr/include
>  Include files for the C compiler.
>  .TP
> +.I /usr/include/bsd
> +BSD compatibility include files (optional).
> +.TP
>  .I /usr/include/X11
>  Include files for the C compiler and the X\-Window system.
>  This is
> @@ -246,6 +281,14 @@ which usually are not invoked directly.
>  More complicated programs may
>  have whole subdirectories there.
>  .TP
> +.I /usr/lib<qual>
> +These directories are variants of
> +.I /usr/lib
> +on system which support more than one binary format requiring separa=
te
> +libraries, except that the symbolic link
> +.I /usr/lib<qual>/X11
> +is not required (optional).
> +.TP
>  .I /usr/lib/X11
>  The usual place for data files associated with X programs, and
>  configuration files for the X system itself.
> @@ -282,6 +325,12 @@ Binaries for locally installed games.
>  .I /usr/local/lib
>  Files associated with locally installed programs.
>  .TP
> +.I /usr/local/lib<qual>
> +These directories are variants of
> +.I /usr/local/lib
> +on system which support more than one binary format requiring separa=
te
> +libraries (optional).
> +.TP
>  .I /usr/local/include
>  Header files for the local C compiler.
>  .TP
> @@ -324,6 +373,9 @@ or
>  .I /usr/share/dict
>  Contains the word lists used by spell checkers (optional).
>  .TP
> +.I /usr/share/dict/words
> +List of English words (optional).
> +.TP
>  .I /usr/share/doc
>  Documentation about installed programs (optional).
>  .TP
> @@ -357,6 +409,18 @@ The message catalogs for native language support=
 go here (optional).
>  .I /usr/share/sgml
>  Files for SGML (optional).
>  .TP
> +.I /usr/share/sgml/docbook
> +DocBook DTD (optional).
> +.TP
> +.I /usr/share/sgml/tei
> +TEI DTD (optional).
> +.TP
> +.I /usr/share/sgml/html
> +HTML DTD (optional).
> +.TP
> +.I /usr/share/sgml/mathtml
> +MathML DTD (optional).
> +.TP
>  .I /usr/share/terminfo
>  The database for terminfo (optional).
>  .TP
> @@ -366,6 +430,15 @@ Troff macros that are not distributed with groff=
 (optional).
>  .I /usr/share/xml
>  Files for XML (optional).
>  .TP
> +.I /usr/share/xml/docbook
> +DocBook DTD (optional).
> +.TP
> +.I /usr/share/xml/xhtml
> +XHTML DTD (optional).
> +.TP
> +.I /usr/share/xml/mathml
> +MathML DTD (optional).
> +.TP
>  .I /usr/share/zoneinfo
>  Files for timezone information (optional).
>  .TP
> @@ -391,6 +464,9 @@ This link is present only for compatibility reaso=
ns and shouldn't be used.
>  This directory contains files which may change in size, such as spoo=
l
>  and log files.
>  .TP
> +.I /var/account
> +Process accounting logs (optional).
> +.TP
>  .I /var/adm
>  This directory is superseded by
>  .I /var/log
> @@ -403,17 +479,56 @@ Reserved for historical reasons.
>  .I /var/cache
>  Data cached for programs.
>  .TP
> +.I /var/cache/fonts
> +Locally-generated fonts (optional).
> +.TP
> +.I /var/cache/man
> +Locally-formatted man pages (optional).
> +.TP
> +.I /var/cache/www
> +WWW proxy or cache data (optional).
> +.TP
> +.I /var/cache/<package>
> +Package specific cache data (optional).
> +.TP
>  .IR /var/catman/cat[1\-9] " or " /var/cache/man/cat[1\-9]
>  These directories contain preformatted manual pages according to the=
ir
>  man page section.
>  (The use of preformatted manual pages is deprecated.)
>  .TP
> +.I /var/crash
> +System crash dumps (optional).
> +.TP
>  .I /var/cron
>  Reserved for historical reasons.
>  .TP
> +.I /var/games
> +Variable game data (optional).
> +.TP
>  .I /var/lib
>  Variable state information for programs.
>  .TP
> +.I /var/lib/hwclock
> +State directory for hwclock (optional).
> +.TP
> +.I /var/lib/misc
> +Miscellaneous state data.
> +.TP
> +.I /var/lib/xdm
> +X display manager variable data (optional).
> +.TP
> +.I /var/lib/<editor>
> +Editor backup files and state (optional).
> +.TP
> +.I /var/lib/<name>
> +These directories must be used for all distribution packaging suppor=
t.
> +.TP
> +.I /var/lib/<package>
> +State data for packages and subsystems (optional).
> +.TP
> +.I /var/lib/<pkgtool>
> +Packaging support files (optional).
> +.TP
>  .I /var/local
>  Variable data for
>  .IR /usr/local .
> @@ -468,6 +583,9 @@ Spooled jobs for
>  .I /var/spool/lpd
>  Spooled files for printing (optional).
>  .TP
> +.I /var/spool/lpd/printer
> +Spools for a specific printer (optional).
> +.TP
>  .I /var/spool/mail
>  Replaced by
>  .IR /var/mail .
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
