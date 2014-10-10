From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: readlink.2 query
Date: Fri, 10 Oct 2014 22:26:30 +0200
Message-ID: <CAKgNAkjjBAKNMbJtyK2UYuSMKWKycz_k8tfCXvijO6H_BsVvrg@mail.gmail.com>
References: <CAGc9Evenz+moY7M_EYuj7JFKCQJcgMCkWdV10wRucE0GiEY_dw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9Evenz+moY7M_EYuj7JFKCQJcgMCkWdV10wRucE0GiEY_dw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jonny

On Thu, Oct 9, 2014 at 1:22 PM, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
> Just looking at readlink.2 I have a query
>
> http://man7.org/linux/man-pages/man2/readlink.2.html
>
> r = readlink(argv[1], linkname, sb.st_size + 1);
>
> Would this example be better without +1 ? We need to save that byte
> for nul terminator.

No -- it;s needed to detect the case

    if (r > sb.st_size) {

> Nicer to add: free(linkname);

Added.

> Also, re ENOMEM is this really kernel memory error?

I'm not sure. No time to check. Do you have some pointer that
indicates that it is wrong?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
