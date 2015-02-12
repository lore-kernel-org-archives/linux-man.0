From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH V2] fgetgrent.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 12 Feb 2015 17:41:21 +0800
Message-ID: <54DC7541.7010603@cn.fujitsu.com>
References: <1423640156-25233-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <54DB0AE3.1080406@gmail.com> <54DB10D4.1050508@cn.fujitsu.com> <CAKgNAki3zOD8-C8PmsDmeqVdY0yOTA=wAR_1giZF3U3-N9i-fQ@mail.gmail.com> <54DB2306.2010101@cn.fujitsu.com> <CAKgNAkiFiGHoTfS3P+Az13EDZzBTXqcBzjmCpt2ybH0KsfkK4Q@mail.gmail.com> <54DC00CA.5080407@cn.fujitsu.com> <54DC62B8.3040100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54DC62B8.3040100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/12/2015 04:22 PM, Michael Kerrisk (man-pages) wrote:
> Hello Ma Shimiao,
>=20
> On 02/12/2015 02:24 AM, Ma Shimiao wrote:
>> Hi Michael,
>> On 02/11/2015 06:20 PM, Michael Kerrisk (man-pages) wrote:
>>> Hi Ma Shimiao,
>>>
>>> On 11 February 2015 at 10:38, Ma Shimiao <mashimiao.fnst-BthXqXjhjHV4OK5fxMSSsQ@public.gmane.org=
=2Ecom> wrote:
>>>> On 02/11/2015 04:28 PM, Michael Kerrisk (man-pages) wrote:
>>>>> Hi Ma Shmiao,
>>>>>
>>>>> On 11 February 2015 at 09:20, Ma Shimiao <mashimiao.fnst-BthXqXjhjHU@public.gmane.org=
su.com> wrote:
>>>>>> Hi Michael,
>>>>>> On 02/11/2015 03:55 PM, Michael Kerrisk (man-pages) wrote:
>>>>>>> On 02/11/2015 08:35 AM, Ma Shimiao wrote:
>>>>>>>> The marking matches glibc marking.
>>>>>>>>
>>>>>>>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>>>>>>>> ---
>>>>>>>>  man3/fgetgrent.3 | 12 ++++++++++++
>>>>>>>>  1 file changed, 12 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/man3/fgetgrent.3 b/man3/fgetgrent.3
>>>>>>>> index 57665dd..e599483 100644
>>>>>>>> --- a/man3/fgetgrent.3
>>>>>>>> +++ b/man3/fgetgrent.3
>>>>>>>> @@ -90,6 +90,18 @@ is set to indicate the cause.
>>>>>>>>  Insufficient memory to allocate
>>>>>>>>  .I group
>>>>>>>>  structure.
>>>>>>>> +.SH ATTRIBUTES
>>>>>>>> +For an explanation of the terms used in this section, see
>>>>>>>> +.BR attributes (7).
>>>>>>>> +.TS
>>>>>>>> +allbox;
>>>>>>>> +lb lb lb
>>>>>>>> +l l l.
>>>>>>>> +Interface   Attribute       Value
>>>>>>>> +T{
>>>>>>>> +.BR fgetgrent ()
>>>>>>>> +T}  Thread safety   MT-Unsafe race:fgrent
>>>>>>>
>>>>>>> Why the change here in the V2? What does "fgrent" refer to?
>>>>>>
>>>>>> race:fgrent is right mark, I made a mistake.
>>>>>> race:fgrent is similar to race:grent.
>>>>>> race:grent is used to indicate data race exists in getgrent(), s=
etgrent() and endgrent().
>>>>>> race:fgrent is used to indicate data race exists when using fget=
grent() in multi-thread.
>>>>>
>>>>> My question then is: how does the reader know that "grent" refers=
 to
>>>>> "getgrent(), setgrent() and endgrent()"?
>>>>
>>>> From definition of race in glibc manual, we get:
>>>> If data race exists and objects cause data race are not from user,
>>>> then the function should be annotated as MT-Unsafe and marked with=
 race.
>>>> And we need a colon and an identifier follows race to tell user wh=
at causes data race.
>>>>
>>>> getgrent(), setgrent() and endgrent() are usually used together.
>>>> Because they need to share an iterator, then data race occurs betw=
een them.
>>>> We want users to know when using them together in multi-thread, da=
ta race makes them
>>>> unsafe in multi-thread. But, we can't definitely write which inter=
nal object causes data race.
>>>> So, we extract the common string 'grent' from functions' name as a=
 identifier which groups
>>>> getgrent(), setgrent() and endgrent() to tell users that the group=
 of *grent() functions
>>>> can't be used together in multi-thread.
>>>
>>> All of the above is fine. But:
>>>
>>>> If a reader understand the definition of race, I think he can know=
 that "grent" refers to
>>>> getgrent(), setgrent() and endgrent().
>>>
>>> I think many readers will not be able to deduce this. (And I think
>>> readers of the glibc manual will have exactly the same problem.) I
>>> think we somehow need to make this a bit clearer, perhaps in a
>>> sentence following the table. Would you have a proposal for such a
>>> sentence?
>>
>> How about the following sentence?
>> "grent" in "race:grent" is an identifier which groups functions xxxg=
rent() used to remind that
>> if functions xxxgrent() were used together in multi-thread, data rac=
e would occur.
>=20
> I think that's a good start, but I'd prefer something a little more e=
xplicit:
>=20
> [[
> In the above table,
> .I grent in
> .I race:grent
> signifies that if any of the functions
> .BR setgrent (),
> .BR getgrent (),
> or
> .BR endgrent ()
> are used in parallel in different threads of a program, then data rac=
es could occur.
> ]]
>=20
> How would that be?

That looks fine. I will add them in new patch.
>=20
> Also, what is the analogous text for fgetgrent() / "fgrent"? Is the p=
roblem
> races between different threads using fgetgrent() or is it races with=
 another=20
> thread using setgrent/getgrent/sendgrent? If the former, I don't unde=
rstand=20
> why we need the identifier "fgrent" instead of just using "fgetgrent"=
=2E
The problem is the former.
At first, I chose fgetgrent as identifier.
Then, I found fgrent is used in glib manual.
As fgetgrent looks like getgrent(), I thought make identifier of race t=
o be
similar is not a bad idea.
At the end, I modified fgetgrent to fgrent.

Now, after thinking for while, fgetgrent seems more suitable.
I=E2=80=98m sorry for sending patches in haste.
I haven't asked glibc community why they choose to use fgrent.
After talking with them, I will send a new patch.
Is it OK?


Thanks
>=20
> Thanks,
>=20
> Michael
>=20


--=20
Ma Shimiao
Development Dept.I
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
