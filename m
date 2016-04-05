From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] execve.2: EPERM from filesystem capabilities.
Date: Mon, 4 Apr 2016 23:25:01 -0400
Message-ID: <20160405032501.GD6588@vapier.lan>
References: <20151012194506.GA6346@box2.japko.eu>
 <56DF7325.9030702@gmail.com>
 <20160309201501.GE25658@box2.japko.eu>
 <56E0C0C3.6040808@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vhGNa7FjVicK3r0d"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56E0C0C3.6040808-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Adamski <k@japko.eu>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--vhGNa7FjVicK3r0d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10 Mar 2016 01:33, Michael Kerrisk (man-pages) wrote:
> Okay -- I got it at last. I think the explanation requires quite=20
> some detail. I added this to execve(2):
>=20
>        EPERM  A  "capability-dumb"  applications  would not obtain the
>               full set of permitted capabilities granted by  the  exe=E2=
=80=90
>               cutable file.  See capabilities(7).

this sounds wrong for multiple reasons:
- "A applications" doesn't make sense ... making "application" singular
  seems to be the most logical step
- it should be "could not obtain" instead of "would not obtain"
- the cap part sounds confusing/misleading to me -- filesystem based caps
  can modify the effective, inheritable, or permitted set
- calling them "capability-dumb" is prejudicial ... see below

how about:
An application with capabilities attached via the filesystem was unable
to update the capability sets.  See capabilities(7).

> And this to capabilities(7):
>=20
>    Safety checking for capability-dumb binaries
>        A  capability-dumb binary is a legacy application that has been
>        marked to have file capabilities, but has not been converted to
>        use  the  libcap(3)  API  to  manipulate its capabilities.  (In
>        other words, this is  a  traditional  set-user-ID-root  program
>        that has been switched to use file capabilities, but whose code
>        has not been modified to understand  capabilities.)   For  such
>        applications,  the effective capability bit is set on the file,
>        so that  the  file  permitted  capabilities  are  automatically
>        enabled  in  the process effective set when executing the file.
>        The kernel recognizes a file which has the effective capability
>        bit  set  as  capability-dumb  for  the  purpose  of  the check
>        described here.

this text makes it sound like using filesystem caps is always wrong when
in reality it's quite a desirable feature.  let's look at ping since that
is what spawned this thread.

historically, the only way to make `ping` usable by non-root users was
to make it setuid.  this left admins with an ugly choice: non-root users
didn't get ping access, or they had to mark a networking binary setuid.
historically admins/distros just made it setuid.

the ping authors tried to make this less of a security issue by adding
logic to drop root during most of its execution and only grab it again
when trying to create the raw socket.  but still, the program could be
abused because it's setuid.

libcap comes into play as a way to more selectively drop caps *that it
already has*.  even if ping is linked against libcap and makes calls to
it, it still must be granted the caps in the first place.  which means
the program continues to be marked setuid, and there's still code that
can be abused (even if we manage to close the window a little bit).

with the introduction of filesystem caps, we now have an even better
option: the program is *not* marked setuid, but we do grant it the few
caps it needs to run.  so even from the very first insn executed, the
kernel has guaranteed that all the other unrelated caps are dropped.

libcap is still orthogonal here: it's a method to manage caps you have
and could still be used to drop things once it's got the raw socket,
but it also still does not help for non-root users.

there is a side story specific to ping with later kernels wrt the new
IPPROTO_ICMP socket type, but that only worked for ICMP & IPv4.  it
would be a few more years before IPv6 support was added.  it also had
to be setup first with specific group ranges which made it a pita.

calling an application that uses filesystem capabilities "dumb" is like
calling every application that is marked setuid "dumb".  it just doesn't
make sense.
-mike

--vhGNa7FjVicK3r0d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXAzANAAoJEEFjO5/oN/WBBjsP/3RZqyoEkz/aExv8rxjXbt15
aArevlG/ZUKhwjXAk4Az7yccR+nRjWgmS0YzIQ8Li69yV6EznixU1Dqs+0EB5nhH
CdHhmTR8z/ZyoHAqfClZUUqbIP50t4qFQnVTtstvCls5XQwpai1/fJsUWa/fCm4y
+oMIxWTh1WI8R1g79DMy510U89MytIvhlsuGxgG+Rw4Vc+djEUp6d1ZlokJxO2JW
nHvo7WlSH1GWhj24VWDeXVdfuX6OgqUXASazu/pckVv3N5e9SGSwJqa/5/7cETt9
BxznivyNzMKshFo9b2/PAtUn096Jv0TOW4GGj9UMU5MYvzM0WPTVioU7MZPQ9pKh
/I9fpEJtnMV0AzH+UpATvj7Cu330I4WGBOUtx3yHRlzXUVgsx4kmO8IajBGiwRko
OSWPsq/53jfNIuxU53ueRB1fdHQ8POqQSYAVYiNPD8FdyuZ8CStjbgpWGeU2WeHB
HZ5D4pXKNviFbIWFL8+NPkUFdEpEzgQczNISXvsrZKfSXbEXIwabE4liGU2FZQmj
1u5e9UiWDuNbSWted4kF3rNNHvzgLqE0S8xN2LEUEMVTbqrfYEVJRKPaPTlc88UY
SkWtK0OuC015AlgoZzP4cVDglbylwbvinIvw+uzrN09sx6eBIN9NXOo81f5UOuvo
C2Kf0xtqmpvtkDmVXQAG
=B5ns
-----END PGP SIGNATURE-----

--vhGNa7FjVicK3r0d--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
