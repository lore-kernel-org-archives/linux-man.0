From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: possible crypt(3) omission
Date: Sun, 24 Aug 2008 06:13:03 +0200
Message-ID: <cfd18e0f0808232113u2cd4aedck88990fc03fc9982e@mail.gmail.com>
References: <b19eae4e0808231903p21132a11u73c59b3ea2a86629@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b19eae4e0808231903p21132a11u73c59b3ea2a86629-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Burchell <w00t-0jOx0kRqhY5g9hUCZPvPmw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Robin,

On Sun, Aug 24, 2008 at 4:03 AM, Robin Burchell <w00t-0jOx0kRqhY5g9hUCZPvPmw@public.gmane.org> wrote:
> Hi,
>
> I read the manpage for crypt(3) to try figure out what was causing a
> NULL return (and then dug around in glibc also), and it seems ERANGE
> isn't mentioned on there, yet is possibly returned.. is this an
> omission? Or a mistake on my part?

I haven't looked at th glibc code yet, but could you say a little more
about the circumstances that cause the ERANGE error?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
