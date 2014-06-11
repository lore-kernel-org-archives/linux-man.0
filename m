From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] iconvconfig.8: New page for iconvconfig(8)
Date: Wed, 11 Jun 2014 16:27:12 +0300
Message-ID: <53985930.9070305@redhat.com>
References: <5396C42D.9070806@redhat.com> <53975FC5.9060305@gmail.com> <53980ECB.7000307@redhat.com> <53982F78.5090504@gmail.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53982F78.5090504-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On 2014-06-11 13:29, Michael Kerrisk (man-pages) wrote:
> On 06/11/2014 10:09 AM, Marko Myllynen wrote:
>> On 2014-06-10 22:43, Michael Kerrisk (man-pages) wrote:
>>> On 06/10/2014 10:39 AM, Marko Myllynen wrote:
>>>>
>>>> while writing the iconv(1) page I noticed there was no page for
>>>> iconvconfig(8) so I wrote one, please see below.
>>>
>>> Again, some comments below. Could you address and send a v2, please.
>>
>> ok, please see below, hopefully the explanation are now clearer
>> without going into too low level details.
>> +a fastloading gconv module configuration cache file.
> 
> I see that since you wrote the last version, you did a s/iconv/gconv/
> in the above line. That typo really confused me before; now things make 
> more sense.

I'm not sure does it really classify as a typo, it's more like that
gconv = GNU (C library) iconv implementation, they can often be used
interchangeably. It's indeed a bit confusing but sticking with one or
the other is a bit hard given that the program name is iconv and the
environment variable is GCONV_PATH.

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
