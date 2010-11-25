From: Emil Mikulic <emikulic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: stat(2) off by one
Date: Thu, 25 Nov 2010 17:53:08 +1100
Message-ID: <AANLkTi=85uQOOr7dUN8k7u7WkRRK2cgoV3gdt6w4rOgE@mail.gmail.com>
References: <AANLkTim=JUmVVv+kfh-MX4H_zsitAgnOHiooxFRuYBNn@mail.gmail.com>
	<AANLkTin1-g6vVN3B7UBUzmqwCU7dRVzCQ-5aps70ckd9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTin1-g6vVN3B7UBUzmqwCU7dRVzCQ-5aps70ckd9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Nov 25, 2010 at 4:32 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> Hello Emil,
>
> On Thu, Nov 25, 2010 at 1:58 AM, Emil Mikulic <emikulic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
>> As seen on http://www.kernel.org/doc/man-pages/online/pages/man2/sta=
t.2.html:
>>
>> =A0 =A0 =A0 EOVERFLOW
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0(stat()) path refers to a file whose size=
 cannot be
>> represented in the
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0type off_t. =A0This can occur when an app=
lication compiled
>> on a 32-bit
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0platform without -D_FILE_OFFSET_BITS=3D64=
 calls stat() on
>> a file whose
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0size exceeds (2<<31)-1 bits.
>>
>> I believe 2<<31 should read 1<<31 (which equals 2^31).
>>
>> I've tested this on an Ubuntu 10.04 system and the largest file I ca=
n
>> successfully stat [without the #define] is 2147483647 bytes.
>
> Thanks for the report. You are of course right, and I made the change
> you suggest for man-[ages-3.32.

Excellent!  Thanks a bunch!
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
