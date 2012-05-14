From: Jim Hill <gjthill-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH]  Psuedo->Pseudo
Date: Mon, 14 May 2012 13:21:59 -0700
Message-ID: <4FB16967.1060606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


---
  man4/pts.4 | 2 +-
  man7/pty.7 | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man4/pts.4 b/man4/pts.4
index 7164e10..ff81c63 100644
--- a/man4/pts.4
+++ b/man4/pts.4
@@ -44,7 +44,7 @@ programs such as
  in which data read from the pseudoterminal master is sent across the 
network
  to a client program that is connected to a terminal or terminal emulator.
  .PP
-Psuedoterminals can also be used to send input to programs that normally
+Pseudoterminals can also be used to send input to programs that normally
  refuse to read input from pipes (such as
  .BR su (1),
  and
diff --git a/man7/pty.7 b/man7/pty.7
index c6d8c35..2860b30 100644
--- a/man7/pty.7
+++ b/man7/pty.7
@@ -48,7 +48,7 @@ that is connected to the slave.
  Conversely, anything that is written to the slave end of the
  pseudoterminal can be read by the process that is connected to
  the master end.
-Psuedoterminals are used by applications such as network login services
+Pseudoterminals are used by applications such as network login services
  .RB ( ssh "(1), " rlogin "(1), " telnet (1)),
  terminal emulators,
  .BR script (1),
-- 
1.7.10.1.456.g16798d0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
