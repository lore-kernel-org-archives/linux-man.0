From: Stas Sergeev <stsp-cmBhpYW9OiY@public.gmane.org>
Subject: Re: Documenting sigaltstack SS_AUTODISRM
Date: Thu, 25 May 2017 12:17:07 +0300
Message-ID: <3a4f9f3e-fc33-cf98-2322-27087664813f@list.ru>
References: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
 <08467ae1-7187-3b2a-9a78-8af0c10bf816@list.ru>
 <3907bc2a-0645-8d93-6ee5-3f99874e7022@gmail.com>
 <32d95303-5839-9279-a1d3-a06f34e3484e@list.ru>
 <CAKgNAkgw6P5RAsA2RSFJX57b=DHM=eNZ+ZOoagcO3ydSHzBcQA@mail.gmail.com>
 <50de8f3b-8a1e-df50-b5dd-d1b74cb77fad@list.ru>
 <026308b5-4e92-4439-1eb2-82b67584d548@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <026308b5-4e92-4439-1eb2-82b67584d548-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-MW
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

24.05.2017 14:09, Michael Kerrisk (man-pages) пишет:
> One could do this I suppose, but I read POSIX differently from
> you and, more importantly, SS_ONSTACK breaks portability on
> numerous other systems and is a no-op on Linux. So, the Linux man
> page really should warn against its use in the strongest terms.
So how about instead of the strongest terms towards
the code's author, just explain that SS_ONSTACK is a
bit-value on some/many OSes, and as such, 0 is a
valid value to enable sas on them, plus all the other
values would give EINVAL?
No strongest terms will help w/o an explanation,
because people will keep looking for something that
suits as a missing SS_ENABLE.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
