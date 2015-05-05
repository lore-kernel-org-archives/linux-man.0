From: Shawn Landden <shawn@churchofgit.com>
Subject: Re: [PATCH] man7/multiarch.7: new manpage
Date: Tue, 5 May 2015 08:20:27 -0700
Message-ID: <CAJusiZXZYkb2UT=Rem56cLguKfTtCJUQA8UUvzcbp=9peULNKg@mail.gmail.com>
References: <1428368938-104443-1-git-send-email-shawn@churchofgit.com>
	<20150505075511.GA10402@gaara.hadrons.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-embedded=gldde-debian-embedded=gmane.org@lists.debian.org>
Sender: shawnlandden@gmail.com
In-Reply-To: <20150505075511.GA10402@gaara.hadrons.org>
Resent-Message-ID: <JTOIZWclshK.A.44F.b_NSVB@bendel>
List-URL: <http://lists.debian.org/debian-embedded/>
List-Post: <mailto:debian-embedded@lists.debian.org>
List-Help: <mailto:debian-embedded-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-embedded-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-embedded-request@lists.debian.org?subject=unsubscribe>
To: Guillem Jover <guillem@debian.org>, Shawn Landden <shawn@churchofgit.com>, linux-man@vger.kernel.org, cross-build@lists.debian.org, debian-embedded@lists.debian.org
List-Id: linux-man@vger.kernel.org

On Tue, May 5, 2015 at 12:55 AM, Guillem Jover <guillem@debian.org> wrote:
> Hi!
>
> The CC list seems to include only some barely related lists. I'm also
> a bit conflicted about whether this belongs in man-pages upstream,
> being it pretty much distribution-specific. OTOH having something like
> this there, might make it easier to understand for people outside the
> Debian-world.
This came out of man-pages' ld.so(8) mentioning /lib64 and /usr/lib64.
I too am not sure if it belongs here, but was mearly trying to correct
the current AMD64-inspired FHS spec that Debian declined to implement
and which inspired Multiarch. (Should we include this history?)
>
> On Mon, 2015-04-06 at 18:08:58 -0700, Shawn Landden wrote:
>> diff --git a/man7/multiarch.7 b/man7/multiarch.7
>> new file mode 100644
>> index 0000000..dc80859
>> --- /dev/null
>> +++ b/man7/multiarch.7
>> @@ -0,0 +1,105 @@
>> +.\" Copyright (c) 2015 by Michael Kerrisk <mtk.manpages@gmail.com>
>
> I don't think that's correct?
Fixed
>
>> +.SH DESCRIPTION
>> +Multiarch
>> +is a way of installing multiple binary targets (such as
>> +.BR i386-linux-gnu
>> +and
>> +.BR amd64-linux-gnu )
>
> This one should be x86_64-linux-gnu.
Obviously
>
>> +on one
>> +.BR hier (7)
>> +filesystem, which originated in (but is not limited to)
>> +Debian and Ubuntu.
>> +.sp
>> +This manpage covers the filesystem aspects of multi-arch.
>> +For packaging details refer either to the spec linked to at the bottom =
of this
>
>> +document or the documentation for
>> +.BR dpkg (1).
>> +For a list of variables set during cross-compilation see
>> +.BR dpkg-architecture (1).
>
> This again is very Debian-centric, not sure if it belongs there?
Removed
>
>> +.SS
>> +.\"
>
> A stray subsection?
Fixed
>
>> +.SH CONFORMING TO
>> +.BR https://wiki.ubuntu.com/MultiarchSpec
>> +.sp
>> +.BR https://wiki.ubuntu.com/MultiarchCross
>
> Those two have been either out-of-date or out-of-sync with the
> implementation for a long time now=E2=80=A6
Removed.
>
> Thanks,
> Guillem
>
>
> --
> To UNSUBSCRIBE, email to debian-embedded-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org
> Archive: https://lists.debian.org/20150505075511.GA10402@gaara.hadrons.or=
g
>



--=20
Shawn Landden
