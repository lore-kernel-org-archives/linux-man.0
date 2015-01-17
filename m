From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getpw.3: Function could return -1 and set errno to zero.
Date: Sat, 17 Jan 2015 09:41:35 +0100
Message-ID: <54BA203F.3020100@gmail.com>
References: <54B8857F.2060307@redhat.com> <54B8B1EB.4040000@gmail.com> <54B97C72.6060809@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B97C72.6060809-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/16/2015 10:02 PM, Carlos O'Donell wrote:
> On 01/16/2015 01:38 AM, Michael Kerrisk (man-pages) wrote:
[...]
>> +If
>> +.I uid
>> +is not found in the password database,
>> +.BR getpw ()
>> +returns 0, sets
> 
> Should be "returns -1" not "returns 0".

D'oh! Thanks for catching that typo, Carlos. Fixed now.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
