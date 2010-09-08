From: "Daniel U. Thibault" <d.u.thibault-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
Subject: Errors in man git
Date: Wed, 08 Sep 2010 10:36:53 -0400
Message-ID: <BLU0-SMTP666507C6D3E37A50B92431BB720@phx.gbl>
Reply-To: D.U.Thibault-qnhUSoYa74pBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, git-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


     There are no indications in the "man git" pages as to how to repor=
t=20
errors, so I'm following the instructions I googled at=20
http://www.kernel.org/doc/man-pages/reporting_bugs.html (adding=20
git-u79uwXL29TY76Z2rM5mHXA@public.gmane.org to the mailing list as it seems appropriate).

    The "man git" pages give the syntax (SYNOPSIS) as:

##########
git [--version] [--exec-path[=3DGIT_EXEC_PATH]] [--html-path]
            [-p|--paginate|--no-pager] [--no-replace-objects]
            [--bare] [--git-dir=3DGIT_DIR] [--work-tree=3DGIT_WORK_TREE=
]
            [--help] COMMAND [ARGS]
##########

    Hence "git COMMAND" should work once the appropriate value is=20
substituted for COMMAND.  The COMMANDs are later documented (GIT=20
COMMANDS) as long lists of "porcelain" and "plumbing" COMMANDs. =20
However, *none* of the COMMANDs given actually work.  For instance, one=
=20
(porcelain) COMMAND is "git-gui" but typing "git git-gui" in a command=20
shell results in the message:

##########
git: 'git-gui' is not a git command. See 'git --help'.
##########

    The actual COMMAND (documented under "man git-gui") is "gui".

    Now, if the intent of the COMMAND lists is to send the user off to=20
the other man-pages, that is fine but ought to be clearly indicated by =
a=20
preamble of some sort.  Maybe the man pages should read something like:

##########
GIT COMMANDS
        We divide git into high level ("porcelain") commands and low le=
vel
        ("plumbing") commands.

        The actual COMMAND strings are documented under the individual
        man pages listed in what follows.  For instance, the COMMAND fo=
r
        "adding file contents to the index" is given by the git-add man=
=20
pages.
##########

Daniel U. Thibault
a.k.a. Urhixidur
a.k.a. Seigneur Boh=E9mond de Nic=E9e
URL: <http://www.bigfoot.com/~D.U.Thibault>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
