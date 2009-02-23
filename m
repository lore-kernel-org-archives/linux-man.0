From: "Carlos O'Donell" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Subject: [PATCH] write.2: Mention EWOULDBLOCK in ERRORS.
Date: Mon, 23 Feb 2009 00:12:14 -0500
Message-ID: <119aab440902222112y11a770f4nf1f1824b9464c9c1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle McMartin <kyle-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Matthew Wilcox <matthew-Ztpu424NOJ8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Feb 22, 2009 at 10:31 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hmmm -- "often" is rather strong.  I will certainly allow
> "occasionally" (or perhaps a little more), and I note in passing that
> for someone making the claim of "often", I never saw a patch from you
> so far to correct an error...

Sorry Michael, I actually meant to say "often incomplete" instead of
"often incorrect." I appreciate your work on the man-pages project.

As penance.

~~~
The write.2 man-page should mention EWOULDBLOCK could be returned by a
write to a socket.

POSIX says it may return EWOULDBLOCK by a write to a socket.
http://www.opengroup.org/onlinepubs/009695399/functions/write.html

It appears that some of the linux kernel net code in 2.6.29-rc5 may
return -EWOULDBLOCK, but I can't be 100%  sure that it would be the
result of a write to a socket.

Patch is against git master.
~~~
diff --git a/man2/write.2 b/man2/write.2
index 3bcc93d..ad9ef56 100644
--- a/man2/write.2
+++ b/man2/write.2
@@ -157,6 +157,13 @@ When this happens the writing process will also receive a
 signal.
 (Thus, the write return value is seen only if the program
 catches, blocks or ignores this signal.)
+.TP
+.B EAGAIN
+or
+.B EWOULDBLOCK
+.I fd
+is a socket, is marked O_NONBLOCK, and write would block. Sockets
+created with SOCK_NONBLOCK are marked O_NONBLOCK.
 .PP
 Other errors may occur, depending on the object connected to
 .IR fd .
~~~

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
