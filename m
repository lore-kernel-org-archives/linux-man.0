From: Norman Hardy <norm-vN3M59HtaNxWk0Htik3J/w@public.gmane.org>
Subject: man scp
Date: Fri, 7 Oct 2011 12:56:36 -0700
Message-ID: <21495CC4-CE78-4174-8DD7-34EFEEF0BDF2@cap-lore.com>
Mime-Version: 1.0 (Apple Message framework v1244.3)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I discovered this problem on Apple's version of Linux.
Two other systems had the same problem however.
Google recommended you for man page bugs.
I may try to find out how to submit this to Apple too.

The man page for scp is misleading.
The last of the sequence of file operands is the destination directory name and not a file name.
I conclude this from the claimed ancestry of the "rcp" command and also a few tests.
The man page for rcp is clearer in this regard.
It also seems to work if the last entry is indeed a file name at least if that name matches the source name.
I have not tested other possibilities.
I do not rule out the possibility that there is a bug in destination computer's scpd deamon, but it seems unlikely to me.
I have done the test on two distinct destination systems.

To be clear the tests that I have done carefully follow:

I performed the following two shell commands:

scp t1 ootbcomp.com:scpTest
scp t2 t3 ootbcomp.com:scpTest

I then verified that files t1, t2 and t3 had been correctly transmitted to the machine ootbcomp.com, into directory ~/scpTest where tilda evaluates to the same string on both machines.

This is useful behavior which I use and which cannot be explained by the scp man page on any of several *nix systems that I tried.

I suspect that I do not understand scp's behavior and thus decline to suggest how the man page should be fixed.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
