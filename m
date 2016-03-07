From: Patrick Donnelly <batrick-dP08NitdTj1Wk0Htik3J/w@public.gmane.org>
Subject: proc(5) fdinfo should mention O_CLOEXEC may be set in file flags
Date: Mon, 7 Mar 2016 14:51:57 -0500
Message-ID: <CACh33FqAXhMsJoFszxNkLG+MWoP6eXKjfaDb1XoDGGcXhdgZFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The man page says this

"The flags field is an octal number that displays the file access mode
and file  status  flags  (see  open(2))."

flags may also include the file descriptor flags (F_GETFD). (Although
there is only the O_CLOEXEC flag and that is explicitly included [1])

[1] https://github.com/torvalds/linux/blob/master/fs/proc/fd.c#L41-L43

-- 
Patrick Donnelly
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
