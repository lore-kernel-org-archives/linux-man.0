From: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Describe race of direct read and fork for unaligned buffers
Date: Wed, 2 May 2012 15:25:58 -0400
Message-ID: <CAHGf_=oOx1qPFEboQeuaeMKtveM2==BSDG=xdfRHz+gFx1GAfw@mail.gmail.com>
References: <CAHGf_=qdE3yNw=htuRssfav2pECO1Q0+gWMRTuNROd_3tVrd6Q@mail.gmail.com>
 <CAHGf_=ojhwPUWJR0r+jVgjNd5h_sRrppzJntSpHzxyv+OuBueg@mail.gmail.com>
 <x49ehr4lyw1.fsf@segfault.boston.devel.redhat.com> <CAHGf_=rzcfo3OnwT-YsW2iZLchHs3eBKncobvbhTm7B5PE=L-w@mail.gmail.com>
 <x491un3nc7a.fsf@segfault.boston.devel.redhat.com> <CAPa8GCCgLUt1EDAy7-O-mo0qir6Bf5Pi3Va1EsQ3ZW5UU=+37g@mail.gmail.com>
 <20120502081705.GB16976@quack.suse.cz> <CAPa8GCCnvvaj0Do7sdrdfsvbcAf0zBe3ssXn45gMfDKCcvJWxA@mail.gmail.com>
 <20120502091837.GC16976@quack.suse.cz> <CAHGf_=qfuRZzb91ELEcArNaNHsfO4BBMPO8a-QRBzFNaT2ev_w@mail.gmail.com>
 <20120502192325.GA18339@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120502192325.GA18339-+0h/O2h83AeN3ZZ/Hiejyg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Cc: Nick Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, mgorman-l3A5Bk7waGM@public.gmane.org, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Woodman <lwoodman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, May 2, 2012 at 3:23 PM, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org> wrote:
> On Wed 02-05-12 15:14:33, KOSAKI Motohiro wrote:
>> Hello,
>>
>> >> I see what you mean.
>> >>
>> >> I'm not sure, though. For most apps it's bad practice I think. If=
 you get into
>> >> realm of sophisticated, performance critical IO/storage managers,=
 it would
>> >> not surprise me if such concurrent buffer modifications could be =
allowed.
>> >> We allow exactly such a thing in our pagecache layer. Although pr=
obably
>> >> those would be using shared mmaps for their buffer cache.
>> >>
>> >> I think it is safest to make a default policy of asking for IOs a=
gainst private
>> >> cow-able mappings to be quiesced before fork, so there are no sur=
prises
>> >> or reliance on COW details in the mm. Do you think?
>> > =A0 =A0Yes, I agree that (and MADV_DONTFORK) is probably the best =
thing to have
>> > in documentation. Otherwise it's a bit too hairy...
>>
>> I neglected this issue for years because Linus asked who need this a=
nd
>> I couldn't
>> find real world usecase.
>>
>> Ah, no, not exactly correct. Fujitsu proprietary database had such
>> usecase. But they quickly fixed it. Then I couldn't find alternative=
 usecase.
> =A0One of our customers hit this bug recently which is why I started =
to look
> at this. But they also modified their application not to hit the prob=
lem.
>
>> I'm not sure why you say "hairy". Do you mean you have any use case =
of this?
> =A0I meant that if we should describe conditions like "if you have pa=
ge
> aligned buffer and you don't write to it while the IO is running, the
> problem also won't occur", then it's already too detailed and might
> easily change in future kernels...

ok, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
