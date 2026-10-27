Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077614;
	b=ebxyoCwmgGpW5OcJRqWeefT9lIGcGjIZ+d8oVBRwwFACFdu+ikjOLH4vuFcU67GH30UK
	 U72zPkh8VegSQFOT+79ashyf91DgK3PYrQPrpdT16m/ZCJjlI8Xxxbk6NmsKvF1rC7+pa
	 lEQxRvJicB5LoJcwKiW93zH/Ntypb0f/a9vamahYKzhg1W4o6aXtXiBH5T4naJnI9CcPN
	 CJM74Z+5reP43ZpsnTueqzQW9EOhQata9Vburyz10ud//rCR1cIzSeVDZBRF0xCWi0H6+
	 yzfuPrfDDP+cCsAGP8zYxy/lLj3jaZqfDHisGtb9aB6+yOz99q1V5tFH97SN4FzHkJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=pIKT8ie8AgUd/7/b+V0Ijyjf8uSbCGSdXiV+wwU4PDg=;
	b=BzIjtG+XD9J/FnF6TeBIDYwq69vKut6eGNaGFnqQUwFi8+X1SnRvH0kGMRjtmgOgoBHf
	 jrLU21+RzV05SUKuZEEEO4cJeoXFkIyja5LdxFAgMi6W0tmuLSNnHuDguXCc5jqUfoT0v
	 /Px3ZHTcYC2j5M3IPf4XxzhwbKUX4l3bLRhCOc/LLjtnlKph1R79VbmI4NY8YRsI3rD5a
	 usu+NgLBM0pZg4cx5E42zBxQfnuty/JfJTMZPv7qFqbDcabbPxi7V1Va/KJcXR8forOPT
	 s9B3ns5ce8XHCymx9y7F5YpaMaL8MlCmwp8fEtJV2OMhv6mfBh6qIeCdeP4N3yuCDiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JIgdZYQY;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C2606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 05:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 996C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JIgdZYQY
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e61a48d5b7so4498855ad.1
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793077613; x=1793682413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pIKT8ie8AgUd/7/b+V0Ijyjf8uSbCGSdXiV+wwU4PDg=;
        b=JIgdZYQYlkubW4nGbMQtlo5mtk5lbE+8WA7FUsfCIXTSsc3E8rxp/ae1ebUqfwNujX
         CMUPKiL43N+KpBnKzvAVpJMgaL0EQOOdNm1WEx6bdDy3NcCavx/DtlLkTr4rwXvBRnMH
         QBoi4aULgaluCfCVjTQEVhLXZqOU4LRDYEufzqBumrFLbg5cxIX+gSkJVZgbzNe0gyZ9
         SGIoRXFurJ4HG56DvbNsh//lcr3jY25rGFBcpaNcdaWns/t3RSWa8KnJjIWDnGA8XEk2
         6D+YtJTJkdRU6VmLd1de6Gx3kqmH1EBMxTDBx9ScfJfhkc0V4irdnG2r6X8tDdzjsDMQ
         ZU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793077613; x=1793682413;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIKT8ie8AgUd/7/b+V0Ijyjf8uSbCGSdXiV+wwU4PDg=;
        b=rDfW042fN7y63KBYJNGz4JUbSa73OA81r6jg6OtkDHjabWaqyNCfI7sSNF6ILcwZQ+
         2UxvetEZ4/cpgNmqkoSlSFKgDRsF/xXUK6slOZm22kPjBuAk1DKoy9apn8nwp5WuCoL6
         inCmEgR+6aLm6umY02SxVNm5usDx7N4t4gSoQ4Mhrd5LfxsNivWHQ1hWw5FApvdyazHV
         19pOtXG42mtLA8nni/asjNJjWha1IgOyIu4ZWERaPHui0OBpkEXWjvWNgSg4YIOCKTZH
         82QT2W/S5DC2qLio9g2rEA/AfQX1R7Aj9VLAt0s8Lsmg1atvpimyzN6EgmmnavQO3VyP
         8QVw==
X-Forwarded-Encrypted: i=1; AKwUvBwi+1NsIR45gBhFK2vGViixIz0Cli0isx5YJSeY9EB4twYJyOtJmXioQVaytAhf9ixBw8owSwRhvq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPuyverNuC6RhraH/4xKUer+QnxOwAzkJKab2ehHJxu8JoVq8k
	VTYjyM5mP5M9AQGmt5bJ0Zly0rofBH1edCbgi/Io304nKBkB3m/nlwVxNyHNyLQG7OTon1wvZQf
	QLZFb2Q==
X-Received: from plha1.prod.google.com ([2002:a17:902:ecc1:b0:2e8:b6a:4fac])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:230d:b0:2e8:3b2d:c0e1
 with SMTP id d9443c01a7336-2eae40d1ef1mr11799675ad.41.1793077612789; Mon, 26
 Oct 2026 22:06:52 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:06:52 +0000
In-Reply-To: <20261026.0cd2577c0b00@gnoack.org>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021212256.27961-1-gnoack3000@gmail.com> <20261021212256.27961-7-gnoack3000@gmail.com>
 <atw9RO1guxx7M7HJ@google.com> <20261026.0cd2577c0b00@gnoack.org>
Message-ID: <auAxPStFAKiJaIxC@google.com>
Subject: Re: [PATCH 6/7] man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD,
 and SCM_PIDFD
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Christian Brauner <brauner@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Oct 2026 00:02:04 +0100, G=C3=BCnther Noack wrote:
> On Sat, Oct 24, 2026 at 05:22:56AM +0000, Kuniyuki Iwashima wrote:
> > On Wed, 21 Oct 2026 23:22:55 +0200, G=C3=BCnther Noack wrote:
> > > These were added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add
> > > SO_PASSPIDFD and SCM_PIDFD") and 7b26952a91cf (2023-06-12; "net: core=
:
> > > add getsockopt SO_PEERPIDFD"), both in Linux 6.5.  They are the PID
> > > file descriptor counterparts of SO_PASSCRED/SCM_CREDENTIALS and
> > > SO_PEERCRED.
> > >=20
> > > SO_PASSPIDFD
> > > 	sk_setsockopt() and sk_getsockopt() in net/core/sock.c handle it
> > > 	as a boolean flag for AF_UNIX sockets (EOPNOTSUPP otherwise).
> > > 	Like SO_PASSCRED, it triggers autobind, which was already
> > > 	mentioned in "Autobind feature".
> > >=20
> > > SCM_PIDFD
> > > 	scm_pidfd_recv() in net/core/scm.c creates the PID file
> > > 	descriptor from scm->pid, which is the PID given in the sender's
> > > 	SCM_CREDENTIALS, or the sender's own PID by default.  The fd is
> > > 	created with O_CLOEXEC by pidfd_prepare().  If pidfd_prepare()
> > > 	fails, its negative error number is put into the cmsg data.
> > > 	Sending SCM_PIDFD is rejected by __scm_send() (EINVAL).
> > >=20
> > > 	Since Linux 6.17, with c679d17d3f2d (2025-07-04; "af_unix:
> > > 	enable handing out pidfds for reaped tasks in SCM_PIDFD"),
> > > 	PIDFD_STALE is passed, so this also works for reaped processes.
> > > 	Before that, pidfd_prepare() returned -EINVAL for them.
> > >=20
> > > SO_PEERPIDFD
> > > 	sk_getsockopt() returns a PID file descriptor for sk_peer_pid,
> > > 	or fails with ENODATA if there is none.
> > >=20
> > > 	Since Linux 6.16, with 20b70e58961b (2025-04-28; "net, pidfs:
> > > 	enable handing out pidfds for reaped sk->sk_peer_pid"), this also
> > > 	works for reaped processes on AF_UNIX sockets.  Before that, it
> > > 	failed with EINVAL.
> > >=20
> > > Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> > > Cc: Christian Brauner <brauner@kernel.org>
> > > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > > Cc: Eric Dumazet <edumazet@kernel.org>
> > > Assisted-by: LLM
> > > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > ---
> > >  man/man7/unix.7 | 101 ++++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 101 insertions(+)
> > >=20
> > > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > > index 67dd10cc146f..a4457508fd2a 100644
> > > --- a/man/man7/unix.7
> > > +++ b/man/man7/unix.7
> > > @@ -316,6 +316,33 @@ and returned as the result of
> > >  .BR getsockopt (2)
> > >  is an integer boolean flag.
> > >  .TP
> > > +.BR SO_PASSPIDFD " (since Linux 6.5)"
> > > +.\" commit 5e2ff6704a275be009be8979af17c52361b79b89
> >=20
> > Why does pidfd only have SHA1 ?
>=20
> I'm removing it from the code and keeping it in the commit message, as
> in the other commits above.
>=20
>=20
> > > @@ -367,6 +394,43 @@ stream and sequenced-packet sockets, and for
> > >  .B AF_UNIX
> > >  socket pairs created using
> > >  .BR socketpair (2).
> > > +.TP
> > > +.BR SO_PEERPIDFD " (since Linux 6.5)"
> > > +.\" commit 7b26952a91cf65ff1cc867a2382a8964d8c0ee7d
> > > +This read-only socket option returns a new PID file descriptor
> > > +(see
> > > +.BR pidfd_open (2))
> > > +referring to the peer process connected to this socket.
> >=20
> > Not sure if this is worth noting here, but "peer process" is
> > a bit unclear.
> >=20
> > For example, if process A creates socekt A, calls listen(),
> > and pass it to process B and close()s the fd, and process C
> > creates socket C and connects to socket A, then getsockopt(C,
> > SO_PEERPIDFD) will return process A, not B.
>=20
> I think it is OK; The phrase "peer process connected to this socket"
> is adapted from the description of SO_PEERCRED, and to clarify, the
> next sentence refers to the description of SO_PEERCRED in the same
> file:
>=20
> > > +This is the process whose credentials are returned by
> > > +.BR SO_PEERCRED .
>=20
> ^ Here
>=20
> I think the SO_PEERCRED description is good:
>=20
>   This read-only socket option returns the credentials of the peer
>   process connected to this socket.  The returned credentials are
>   those that were in effect at the time of the call to connect(2),
>   listen(2) or sockepair(2).
>=20
> (It is good, because it puts the common use case first, where the
> entire BSD socket dance is done by the same process, and then
> clarifies the details for the people who need them.)
>=20
> So this seems fair to me, imho.  Let me know whether that seems
> acceptable to you.

Probably okay as is.  Maybe not many people is using socket
activation w/ systemd.
