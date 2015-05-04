From: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Subject: Re: get_phys_pages.3 review
Date: Mon, 04 May 2015 09:58:28 -0400
Message-ID: <55477B04.7030001@tuffbizz.com>
References: <55468DF3.3070908@tuffbizz.com> <554728F2.6050406@gmail.com> <55476D0B.8070301@gmx.com> <5547798D.2070507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5547798D.2070507-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael, William,

On 05/04/2015 09:52 AM, Michael Kerrisk (man-pages) wrote:
> Hi William,
>=20
> On 05/04/2015 02:58 PM, J William Piggott wrote:
>> On 05/04/2015 04:08 AM, Michael Kerrisk (man-pages) wrote:
>>> Hello William,
>>>
>>> On 05/03/2015 11:06 PM, William Woodruff wrote:
>>
>>
>>>> returns the total number of physical pages of memory available on =
the
>>>> system.
>>>> .sp
>>>
>>> No need for .sp here. Just use a blank line for the para break.
>>
>> This is Groff specific behavior. From roff(7):
>>  =C2=B7      Never include empty or blank lines in a roff document.
>=20
> I'm not sure whether that text applies or not. But in any case,
> we've got hundreds of pages that happily use blank lines.
> If you mist, you can instead use ".PP", but ".sp" seems
> wrong to me.

I'll follow your advice here. I've seen the rule about never using
blank lines in groff, but if other pages do it, I'll assume the behavio=
r
is reasonable.

Best,
William Woodruff

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
