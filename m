From: Roger Pate <roger-BhOJIT0taCA@public.gmane.org>
Subject: Quoting in man 5 core
Date: Mon, 8 Nov 2010 18:36:07 -0500
Message-ID: <AANLkTikwZqfGUBciUhNhjvoLr96jXC0rMcgKrOyckb4r@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man 5 core; http://www.kernel.org/doc/man-pages/online/pages/man5/core.5.html

The example section has a sample shell session containing:

  # echo '|$PWD/core_pattern_pipe_test %p UID=%u GID=%g sig=%s'

But $PWD won't be expanded in single quotes.  It should be double
quotes around the entire argument or some other form.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
