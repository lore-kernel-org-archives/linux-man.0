From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: readlink.2 query
Date: Thu, 9 Oct 2014 12:22:47 +0100
Message-ID: <CAGc9Evenz+moY7M_EYuj7JFKCQJcgMCkWdV10wRucE0GiEY_dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello
Just looking at readlink.2 I have a query

http://man7.org/linux/man-pages/man2/readlink.2.html

r = readlink(argv[1], linkname, sb.st_size + 1);

Would this example be better without +1 ? We need to save that byte
for nul terminator.

Nicer to add: free(linkname);

Also, re ENOMEM is this really kernel memory error?

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
