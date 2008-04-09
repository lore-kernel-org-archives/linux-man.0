From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Re: epoll(7) redux
Date: Wed, 09 Apr 2008 18:43:07 -0400
Message-ID: <cone.1207780987.222099.27997.500@commodore.email-scan.com>
References: <cone.1207739243.602382.23947.500@commodore.email-scan.com> <cfd18e0f0804090415m1ddb36bahce8e6b724e60da7d@mail.gmail.com> <Pine.LNX.4.64.0804091209270.7000@alien.or.mcafeemobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-commodore.email-scan.com-27997-1207780987-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-commodore.email-scan.com-27997-1207780987-0001
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Davide Libenzi writes:

> On Wed, 9 Apr 2008, Michael Kerrisk wrote:
> 
>> On Wed, Apr 9, 2008 at 1:07 PM, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org> wrote:
>> > Q2
>> >
>> >   Can two epoll sets wait for the same file descriptor? If so, are events
>> > reported to both epoll file descriptors?
>> >
>> > A2
>> >
>> >   Yes, and events would be reported to both. However, it is not recommended.
>> >
>> > =========
>> >
>> > It's not clear what "not recommended" means. Furthermore, I don't think
>> > there's anything wrong with two epoll file descriptors waiting for different
>> > events on the same file descriptor. One's waiting for POLLIN, the other for
>> > POLLOUT. What's wrong with that?
>> 
>> Perhaps Davide has some thought to offer here?
> 
> You can do it. No problem as far as epoll goes. The "recommended" bit was 
> more because it is very easy to get things wrong from an application 
> perspective POV, when doing that.
> In the case above, first POLLOUT is "almost" always signaled, so you'll 
> receive continuous events over there. Second, if both events shows up at 
> the same time (say in two different threads) and you do not take care of 
> it, you'll end up handling the same fd, at the same time, in two different 
> threads.

That's what I had in mind. One thread has the fd in its epoll fd for POLLIN, 
and handles the read aspect of it. Another thread puts the fd into a 
different epoll fd, for POLLOUT, and handles the writing aspect of it. It 
shouldn't be too difficult for both threads to correctly implement their 
corresponding semantics.


--=_mimegpg-commodore.email-scan.com-27997-1207780987-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBH/UZ7x9p3GYHlUOIRAltrAJ9UHHErN+Tw8hO/bWoEvDdakU3bTwCfZ/zS
oKvNQAz9u82+T+HzFW5JWm4=
=HSBn
-----END PGP SIGNATURE-----

--=_mimegpg-commodore.email-scan.com-27997-1207780987-0001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
