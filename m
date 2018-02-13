From: Robin Kuzmin <kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Man Page Typo (waitpid.2)?
Date: Mon, 12 Feb 2018 16:51:16 -0800
Message-ID: <CAAztzVGyGZg1ArO=AWgma_Jq+FKU8Ev5KjKaekYmkEW2Zx1mFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man2/waitpid.2.html
1.
I see: "The wait() system call suspends execution of the calling process...".
I expected: "The wait() system call suspends execution of the calling
thread...".
2.
I see: "The waitpid() system call suspends execution of the calling process...".
I expected: "The waitpid() system call suspends execution of the
calling thread...".
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
