From: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] getpid.2: Note that caching is removed as of glibc 2.25.
Date: Wed, 12 Jul 2017 15:26:41 -0400
Message-ID: <fa6a12f8-5b16-0f1a-027b-b93237b5827c@redhat.com>
References: <f944b6ee-b279-3775-bcd1-200bf88e9af0@redhat.com>
 <b66a2f92-ec5f-d02d-e321-3fa8ae80db21@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b66a2f92-ec5f-d02d-e321-3fa8ae80db21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/12/2017 03:23 PM, Michael Kerrisk (man-pages) wrote:
> Hi Carlos,
> 
> On 07/12/2017 06:57 PM, Carlos O'Donell wrote:
>> Since glibc 2.25 the PID cache is removed.
> 
> Allelujah!

Not everyone agrees :-)

https://bugzilla.redhat.com/show_bug.cgi?id=1469670

-- 
Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
