From: "Robin Burchell" <w00t-0jOx0kRqhY5g9hUCZPvPmw@public.gmane.org>
Subject: possible crypt(3) omission
Date: Sun, 24 Aug 2008 03:03:37 +0100
Message-ID: <b19eae4e0808231903p21132a11u73c59b3ea2a86629@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

I read the manpage for crypt(3) to try figure out what was causing a
NULL return (and then dug around in glibc also), and it seems ERANGE
isn't mentioned on there, yet is possibly returned.. is this an
omission? Or a mistake on my part?

Thanks!
Robin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
