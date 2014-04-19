From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH v5 10/10] manpage: update FALLOC_FL_COLLAPSE_RANGE flag
 in fallocate
Date: Sat, 19 Apr 2014 08:16:35 +0200
Message-ID: <535214C3.1010806@gmail.com>
References: <1392741594-20335-1-git-send-email-linkinjeon@gmail.com> <20140416060510.GA25651@infradead.org> <534FD9B5.3000207@gmail.com> <20140417225701.GY15995@dastard> <alpine.LFD.2.00.1404181140060.2128@localhost.localdomain> <20140418155520.GB16490@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20140418155520.GB16490@thunk.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>, =?UTF-8?B?THVrw6HFoSBDemVybmVy?= <lczerner@redhat.com>
Cc: mtk.manpages@gmail.com, Dave Chinner <david@fromorbit.com>, Christoph Hellwig <hch@infradead.org>, Namjae Jeon <linkinjeon@gmail.com>, linux-man@vger.kernel.org, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 04/18/2014 05:55 PM, Theodore Ts'o wrote:
> On Fri, Apr 18, 2014 at 11:45:35AM +0200, Luk=C3=A1=C5=A1 Czerner wro=
te:
>>
>> I'd like to point out that do_fallocate() in vfs uses ENODEV in the
>> case it is not regular file nor directory.
>>
>> Also I thought of the EOPNOTSUP to be the right way to go. For
>> example we do not support it on non-extent based files in ext4 so we
>> return EOPNOTSUP.
>>
>> The same is for the case that we do not support the particular
>> fallocate mode.
>>
>> So I am not really sure about what's the right error to use.
>=20
> Yes, there is some inconsistency here.  I'll change this particular
> case (a non-REGULAR file to use EINVAL) to be consistent with xfs, bu=
t
> I suspect programs are going to have to be flexible.

Okay -- I'll document EINVAL as the (sole) error for this case.

Thanks, Ted.

> As far as non-extent based files, at least in theory at some point we
> could support COLLAPSE_RANGE on regular files, so I'll leave it as
> EOPNOTSUPP for now, but the choice is admittedly somewhat arbitrary.

Agreed that its somewhat inconsistent, though not as egregiously so as
the other case.

Cheers,

Michael




--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
