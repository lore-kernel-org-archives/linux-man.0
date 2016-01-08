From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: PR_SET_PDEATHSIG by orphan process
Date: Fri, 8 Jan 2016 17:39:49 +0100
Message-ID: <20160108163949.GA4313@pc.thejh.net>
References: <1452104606-25569-1-git-send-email-jann@thejh.net>
 <568FE223.20209@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <568FE223.20209-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2016 at 05:21:55PM +0100, Michael Kerrisk (man-pages) wrote:
> Hi Jann,
>=20
> Your mail is a little cryptic. It would be best to start with
> a brief summary of your point--something like the text of your
> patch at the end of the mail.

Ok, will do that next time. I wanted to avoid duplicating the content.


> On 01/06/2016 07:23 PM, Jann Horn wrote:
> > Proof:
> > In kernel/sys.c:
> >=20
> > 	case PR_SET_PDEATHSIG:
> > 		if (!valid_signal(arg2)) {
> > 			error =3D -EINVAL;
> > 			break;
> > 		}
> > 		me->pdeath_signal =3D arg2;
> > 		break;
>=20
> I don't understand how the code above relates to the point you
> want to make. (Or maybe you mean: "look, there's no check here
> to see that if the parent is already dead"; but it would help
> to state that explicitly).

Yes, that's what I meant.


> > Testcase:
> >=20
> > #include <sys/prctl.h>
> > #include <err.h>
> > #include <unistd.h>
> > #include <signal.h>
> > #include <stdio.h>
> >=20
> > void ponk(int s) {
> >   puts("ponk!");
> > }
> >=20
> > int main(void) {
> >   if (fork() =3D=3D 0) {
> >     if (fork() =3D=3D 0) {
> >       sleep(1);
> >       signal(SIGUSR1, ponk);
> >       prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
> >       sleep(1);
> >       return 0;
> >     }
> >     return 0;
> >   }
> >=20
> >   sleep(3);
> >   return 0;
> > }
> > ---
> >  man2/prctl.2 | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/man2/prctl.2 b/man2/prctl.2
> > index 5cea3bb..3dce8e9 100644
> > --- a/man2/prctl.2
> > +++ b/man2/prctl.2
> > @@ -670,6 +670,9 @@ In other words, the signal will be sent when that t=
hread terminates
> >  (via, for example,
> >  .BR pthread_exit (3)),
> >  rather than after all of the threads in the parent process terminate.
> > +
> > +If the parent has already died by the time the parent death signal
> > +is set, the new parent death signal will not be sent.
>=20
> In a way, this seems almost obvious. But perhaps it is better to make the
> point explicitly, as you suggest. But, because there may have been a
> previous PR_SET_PDEATHSIG, I'd prefer something like this:
>=20
> [[
> If the caller's parent has already died by the time of this
> PR_SET_PDEATHSIG operation, the operation shall have no effect.
> ]]
>=20
> What do you think?

I don't think "no effect" would be strictly correct because weird stuff
happens on subreaper death - I'm not sure whether this is intended or a
bug though:

$ cat deathsig2.c
#include <sys/prctl.h>
#include <err.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>

void ponk(int s) {
  puts("ponk!");
}

int main(void) {
  if (fork() =3D=3D 0) {
    prctl(PR_SET_CHILD_SUBREAPER, 1, 0, 0, 0);
    puts("enabled subreaper");
    if (fork() =3D=3D 0) {
      if (fork() =3D=3D 0) {
        sleep(1);
        puts("setting deathsig...");
        signal(SIGUSR1, ponk);
        prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
        sleep(2);
        return 0;
      }
      puts("parent will die now, causing reparent to subreaper");
      return 0;
    }
    sleep(2);
    puts("subreaper will die now");
    return 0;
  }
  sleep(4);
  return 0;
}
$ gcc -o deathsig2 deathsig2.c
$ cat deathsig3.c
#include <sys/prctl.h>
#include <err.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>

void ponk(int s) {
  puts("ponk!");
}

int main(void) {
  if (fork() =3D=3D 0) {
    prctl(PR_SET_CHILD_SUBREAPER, 1, 0, 0, 0);
    puts("enabled subreaper");
    if (fork() =3D=3D 0) {
      if (fork() =3D=3D 0) {
        puts("setting deathsig...");
        signal(SIGUSR1, ponk);
        prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
        sleep(3);
        return 0;
      }
      sleep(1);
      puts("parent will die now, causing reparent to subreaper");
      return 0;
    }
    sleep(2);
    puts("subreaper will die now");
    return 0;
  }
  sleep(4);
  return 0;
}
$ gcc -o deathsig3 deathsig3.c
$ ./deathsig2
enabled subreaper
parent will die now, causing reparent to subreaper
setting deathsig...
subreaper will die now
ponk!
$ ./deathsig3
enabled subreaper
setting deathsig...
parent will die now, causing reparent to subreaper
ponk!
subreaper will die now
$=20

I didn't manage to find the reason for that in the code.
Sorry, I probably should have tried to figure out the details of
this before sending a manpages patch.

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWj+ZVAAoJED4KNFJOeCOoV+4QAJ7kJeusFeA59v1J2fuzIPUF
rQ/SvCDIeAwJMH2W17ttlY/Ne6pMFvcB0RKZBeIaQwUmA5Ay1790YJy/RU/kpLoU
GL4Dtwozrkd0pyUOAlMnN0i57+a0B9uuLgXGnQOCOsPii6LDCihavEEpZQ8e72Ke
G389xC7eGg0iaH9UntqsctzRWGSKu/jbYo5P1g27CIqFXi2SLQ6Eioxhx+lasz8P
C2zgkGVe4fhV+KEqPayYELA8LRuTmnx75/qmQR0BkG15KJ5HW8qqKAsv6Q3ns68K
qrFQj2q33NI3uL8uhjzI6DEQUd2orIYRykbGke9jvTpOLSYmYOgaW9fg75Y9jq6K
wTvBuU5jJ6HT1RY/h+QgwL2ntIZrvqapazZyUMogW4wFT/tmYQUTLzociLUcO5jD
zRXfXHT6as8M16aSnGcEoqitcAxQ8NHBEzpmlvWQ8SFibE50QzCy6gTmCMAMsvaY
ximbquXzr/AMRrp35n47KhrzsMoa7e54qzn0GK7xtIpnjsilcWUoeS6rGQg0bBZB
mz5mgK9I9+dcqCDEe80qmbRk/YWbj/PjqxRDNdmZFEk9goVRH+CDNmvL701HNPVy
5HhHvbQ6Ju7xaLYABtj8UhaD3EsqBUnQICpS5CDQi3KiISNMwTdc7EoAFPzgFj8P
Vg7zNcuvdQ4qRXP/8Wl3
=sHXj
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
