From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH v5 10/10] manpage: update FALLOC_FL_COLLAPSE_RANGE flag
 in fallocate
Date: Fri, 18 Apr 2014 11:55:20 -0400
Message-ID: <20140418155520.GB16490@thunk.org>
References: <1392741594-20335-1-git-send-email-linkinjeon@gmail.com>
 <20140416060510.GA25651@infradead.org>
 <534FD9B5.3000207@gmail.com>
 <20140417225701.GY15995@dastard>
 <alpine.LFD.2.00.1404181140060.2128@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1404181140060.2128@localhost.localdomain>
Sender: linux-fsdevel-owner@vger.kernel.org
To: =?utf-8?B?THVrw6HFoQ==?= Czerner <lczerner@redhat.com>
Cc: Dave Chinner <david@fromorbit.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Christoph Hellwig <hch@infradead.org>, Namjae Jeon <linkinjeon@gmail.com>, linux-man@vger.kernel.org, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Fri, Apr 18, 2014 at 11:45:35AM +0200, Luk=C3=A1=C5=A1 Czerner wrote=
:
>=20
> I'd like to point out that do_fallocate() in vfs uses ENODEV in the
> case it is not regular file nor directory.
>=20
> Also I thought of the EOPNOTSUP to be the right way to go. For
> example we do not support it on non-extent based files in ext4 so we
> return EOPNOTSUP.
>=20
> The same is for the case that we do not support the particular
> fallocate mode.
>=20
> So I am not really sure about what's the right error to use.

Yes, there is some inconsistency here.  I'll change this particular
case (a non-REGULAR file to use EINVAL) to be consistent with xfs, but
I suspect programs are going to have to be flexible.

As far as non-extent based files, at least in theory at some point we
could support COLLAPSE_RANGE on regular files, so I'll leave it as
EOPNOTSUPP for now, but the choice is admittedly somewhat arbitrary.

Cheers,

					- Ted
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
