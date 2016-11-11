From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getrandom.2, random.4: Consolidate and improve discussion
 on usage of randomness
Date: Fri, 11 Nov 2016 22:32:24 +0100
Message-ID: <cea55428-3d73-851e-50bd-efde1188bdd6@gmail.com>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
 <55B65DAC.6010906@lgeorget.eu>
 <2fc34759-5d2b-4192-9611-b499e23efdf8@gmail.com>
 <1478767372.2642.15.camel@redhat.com>
 <fa60e32a-1364-d0be-245f-d8ead6d04713@gmail.com>
 <1478788558.3579.47.camel@redhat.com>
 <66494ef9-80d1-e437-252a-4a15e1f497db@lgeorget.eu>
 <02c2fa67-ce72-010b-e1ac-ae52c1bc6cf2@gmail.com>
 <1478850099.2484.7.camel@redhat.com>
 <CAKgNAkgb=OEvtRNJaDLO8e3_UaVC-zCQJq8GV1c9fU416RqhLg@mail.gmail.com>
 <48e730fc-4eeb-189e-92b4-eaa2720d3eda@supelec.fr>
 <c542ad59-869f-ea9e-c2a4-cf077182cf0c@lgeorget.eu>
 <1478883732.21107.3.camel@redhat.com>
 <8f750f37-cb7d-50aa-1915-1e78e3996a04@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8f750f37-cb7d-50aa-1915-1e78e3996a04-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Ivan Babrou <ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org, Luke Bratch <luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org>, Onkar Mahajan <on2014nm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/11/2016 06:35 PM, Laurent Georget wrote:
> 
> 
> Le 11/11/2016 à 18:02, Nikos Mavrogiannopoulos a écrit :
>> On Fri, 2016-11-11 at 13:08 +0100, Laurent Georget wrote:
>>
>>> +.I /dev/urandom
>>> +T}	T{
>>> +Cryptographically-secure Random Number Generator (CRNG) output
>>> +T}	T{
>>> +Does not block once the CRNG is ready
>>> +T}	T{
>>> +Returns output from uninitialized CRNG (possibly low entropy and not
>>> suitable for cryptography)
>>
>> I'd make that specific, and mention early boot explicitly, otherwise it
>> implies that this always returns from an uninitialized CRNG. This is a
>> limitation that applies only for applications started on early boot;
>> for the majority of applications this is not applicable.
> 
> The title of the last column is "Behavior in early boot time". We can
> rephrase the content as "Even if the CRNG is not ready yet, returns
> output from it anyway (possibly low entropy and not suitable for
> cryptography)". Does that sound better?

I think the existing text was okay.

> I got the third column wrong by the way, please read  "Never blocks".

Noted!

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
