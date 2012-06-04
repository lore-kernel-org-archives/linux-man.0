From: Alexandre Bique <bique.alexandre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] document CLOCK_MONOTONIC_COARSE
Date: Tue, 5 Jun 2012 00:11:51 +0200
Message-ID: <CAP737oLFzzCKZgvtV3w_2iOppzn_Gkc5zC8mPr3vedFbZ9A=PA@mail.gmail.com>
References: <20120531235955.GA18876@cloudera.com> <CAP737o+rUezC4tiCra-qTiVL2XxbKJ7Z+9oeHrw6hCEkEX8Cyg@mail.gmail.com>
 <CAE_FxDi3ecT8vJnJdeh_T1_2TaTdAWBn=iSb_Z_-EVMW9+6Wxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE_FxDi3ecT8vJnJdeh_T1_2TaTdAWBn=iSb_Z_-EVMW9+6Wxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Isaacson <adi-psgPW5cihnJWk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Jun 4, 2012 at 8:02 PM, Andy Isaacson <adi-psgPW5cihnJWk0Htik3J/w@public.gmane.org> wrote:
> On Sat, Jun 2, 2012 at 2:49 AM, Alexandre Bique
> <bique.alexandre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, Jun 1, 2012 at 1:59 AM, Andy Isaacson <adi-psgPW5cihnJWk0Htik3J/w@public.gmane.org> wro=
te:
>> > +.BR CLOCK_MONOTONIC_COARSE " (since Linux 2.6.32; Linux-specific)=
"
>> > +.\" Added in commit da15cfdae03351c689736f8d142618592e3cebc3, Joh=
n Stultz, Aug 19 2009
>>
>> Is it necessary to specify the commit rev?
>
> Speaking as a git user, it's much more helpful to provide the commitI=
D
> than to just provide committer+date as was done for other items in
> this file. =C2=A0It allows "git tag --contains da15cfdae" to find out=
 what
> release it was merged in, for example.
>
> Is there any downside to having the commit hash in the comment?

I agree with you, it is convenient to have the commit revision when
you need to dig into Linux source code.

--=20
Alexandre Bique
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
