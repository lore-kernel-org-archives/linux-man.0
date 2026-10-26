Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055727;
	b=n1ecsjGV7fVy842wm0ez5q0g6ji9W/5PNhU8hnGXjpcT/ZSJ/zYsx86aO6KaJpZzZ9UJ
	 udmUo5/hifKgIkgePuvci4sJcV7Qo/eahVykhJ88lBzzbEOVXmrc/ANRnBn08G9CfOZaL
	 zgf1ALzsQd0xVbF+EP197jzBEbX5U3PEQy/8LmmEgeNqtV3RJsO4vFr/r+Qs7oDdX6UdL
	 r/aT+Wu9R3vX9guKv07mtZC/mXMOv4lw5BVD/8qw8Xb2qmjElbxnyO5HAsbxOanf7ZBRZ
	 NlJncsAD3Z4sPhvcbwkrp4LjljuQMQQ/69Ws4HsR10Y4vFmKAohc1zyBXmv7I83g2JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=q6uM5zoGU/vQTA7vvAkl6obMIz9ldlMzHwp4XojlTPQ=;
	b=CHT+2cL0V4ypjHVoXawG/0yDVXw18FlEDwjOyGEwzlKNOZN36YCK5x0RCVWv3sVqDO2T
	 84IcRmhSQIFr7SWKl49thtTuy878fk6mEvX1b8Vy95t9jb668hKMy/Jdrmesik1dhZiBc
	 6lmVhHUCeeKywhTwesjGSRxfgiWzyZHQxHtFmz6X4djCKvDu5+a0S5vQ6nGrruK1L/abW
	 aJg9KGeAPOzUxmpANCe1ivQeoQAy6KdTkLg4mZikW12iwN7mVJUEaf0VYWHEM6Gm+FcBx
	 w0R7eZiELowzukoHaDQhHepaExlWIuCOtE0QmtPGuuT+pfF2ZimKIgiY3PeQWQZkZew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EWu//rOA";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794A0606A31A
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 23:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 794A0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWu//rOA
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so34057325e9.2
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 16:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793055726; x=1793660526; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q6uM5zoGU/vQTA7vvAkl6obMIz9ldlMzHwp4XojlTPQ=;
        b=EWu//rOAxb/Z5CbVZMEJsE5KxgggEqTMGYt/4cvJBN0YIOe+6yW+Gx7kMqZeXKqrS1
         FNiV2lXwT6tM+j7uCD49nkIdOGdtQg3GWDJ+6d5zNsyOVuJi4gqPutbAYY0d/+T0ACw2
         Fx71a4IvOtxcgStCmJHpr3+J41eM4iLAHs2kAOPpchh6+EQ8dRsABupapfDq9sbFFr/N
         6q6eC38dQwbm9XcwLlBMXJjlIzfBVodGsgHumkxbEGCNOZhkaCc9famexBcL63fdmp2/
         +xAwj5iH+ymMpIk0H69Vjigz2rLGyZ/IBZlnRJHmlFvhKK2xtEpssyINJDKTqAdXGymK
         zLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055726; x=1793660526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q6uM5zoGU/vQTA7vvAkl6obMIz9ldlMzHwp4XojlTPQ=;
        b=JWhHdHSj4PzmuPw17DQ7ieNMl1JMFmWhWf9atpSa5YIgO5h/6iqn0C2cwvn74GJYBY
         j0dpmLbbX1jd2sZ7KJkoQeStF7GuVmeqa7m3jE1PsdnzrqtUTVjbUWF2v6sBXnQquTM6
         /AkqEsNsXphY4Ehu6neERZxBVWT2SQNeV8uKIkA/85B9s1B6WJKJHqSs5S9PUagxCZJU
         Rr9Q+Rwwgm07kdzK032+c15oEZLrqV6lVUlnuRXC/XaEuxcgMPY0SaWEIht9L6BsXUBv
         Pt6VDlC8zcih7Q/GyZEj5wU+xR+RhLAUbfi6b+05jxV7oDlx8zkqNeeRGm22z+8ntO8x
         ZwQA==
X-Forwarded-Encrypted: i=1; AKwUvBxTn7PMnkL89UBO+3ggIdMOlcGM5rlcxftPAZtm/NSvhgUn4A8jmotZKS/D496PbLy82pZphH1db/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXnFAdkY2sRwArJWQKghHOUQHkOQkKKPN4Kzq8kPTPTK8EDAWH
	A/ZBxV0WxA+32QONwTVSvLMKYXlUqG+DAtZTopBrqs3Wgd4t9hbdUpF+sgyUDgX/
X-Gm-Gg: AYBFou26gSZunVJSZqnroGZTMD/zOUS+I2GXnLHv1l/PRW2LSvQFjO1UnIzFj5GkOOJ
	MxE9uSgMjz4RIa1I6xz0lLZAXuZzm47heCJITD8hzyDQvAg/qjIgCpRBWdDyn5+6GyhiXr16iLY
	e2CM7YIpc1GAJcRemr/xClMlB9+c/oHLTWFqmHaB+8FMrMu7vrGu6EwtxgY02vu9L0rSeVjVNpw
	ruZpB9jUC+41cOYysYyok1Is+DtjXBQZ3yKyGTeH7eV0bXZuaKEG6qH31NaSuIZGrjM09e4m74X
	qhkSdJVS8mdpI4FBrFCoO8okJ9iAuHo+7kZIyoHF3SIy/vtxQF2ORn0GEb4h8tGthGqQSANVEfi
	xizPUqvSyWG9+PSfmjTmRZ5oSW/WbBA4betuJlTS6jpcBZu3S0GOOTEDdzxngMXPqo5K0pc60bF
	HepXZoyjVoFzgtuE8oQa0H+jfTtLBak0/9FyHdN+gki1rRGbN5+0m9G2ycxavCDabHhRsC3EFri
	5YLB0UpCZARcePHdoPCs85oYeAdSyAOBVWq5RwQDfbYl9JVTkMHKeEEvc4+Uh8xEdlo5/qK/kls
	iunf2ED7P7gE5bXC5hKHg5iWKw==
X-Received: by 2002:a05:600c:6088:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4a35ac3b010mr137685105e9.4.1793055725687;
        Mon, 26 Oct 2026 16:02:05 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm225245755e9.14.2026.10.26.16.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:02:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 00:02:04 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH 6/7] man/man7/unix.7: Document SO_PASSPIDFD,
 SO_PEERPIDFD, and SCM_PIDFD
Message-ID: <20261026.0cd2577c0b00@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-7-gnoack3000@gmail.com>
 <atw9RO1guxx7M7HJ@google.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atw9RO1guxx7M7HJ@google.com>

On Sat, Oct 24, 2026 at 05:22:56AM +0000, Kuniyuki Iwashima wrote:
> On Wed, 21 Oct 2026 23:22:55 +0200, Günther Noack wrote:
> > These were added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add
> > SO_PASSPIDFD and SCM_PIDFD") and 7b26952a91cf (2023-06-12; "net: core:
> > add getsockopt SO_PEERPIDFD"), both in Linux 6.5.  They are the PID
> > file descriptor counterparts of SO_PASSCRED/SCM_CREDENTIALS and
> > SO_PEERCRED.
> > 
> > SO_PASSPIDFD
> > 	sk_setsockopt() and sk_getsockopt() in net/core/sock.c handle it
> > 	as a boolean flag for AF_UNIX sockets (EOPNOTSUPP otherwise).
> > 	Like SO_PASSCRED, it triggers autobind, which was already
> > 	mentioned in "Autobind feature".
> > 
> > SCM_PIDFD
> > 	scm_pidfd_recv() in net/core/scm.c creates the PID file
> > 	descriptor from scm->pid, which is the PID given in the sender's
> > 	SCM_CREDENTIALS, or the sender's own PID by default.  The fd is
> > 	created with O_CLOEXEC by pidfd_prepare().  If pidfd_prepare()
> > 	fails, its negative error number is put into the cmsg data.
> > 	Sending SCM_PIDFD is rejected by __scm_send() (EINVAL).
> > 
> > 	Since Linux 6.17, with c679d17d3f2d (2025-07-04; "af_unix:
> > 	enable handing out pidfds for reaped tasks in SCM_PIDFD"),
> > 	PIDFD_STALE is passed, so this also works for reaped processes.
> > 	Before that, pidfd_prepare() returned -EINVAL for them.
> > 
> > SO_PEERPIDFD
> > 	sk_getsockopt() returns a PID file descriptor for sk_peer_pid,
> > 	or fails with ENODATA if there is none.
> > 
> > 	Since Linux 6.16, with 20b70e58961b (2025-04-28; "net, pidfs:
> > 	enable handing out pidfds for reaped sk->sk_peer_pid"), this also
> > 	works for reaped processes on AF_UNIX sockets.  Before that, it
> > 	failed with EINVAL.
> > 
> > Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Cc: Eric Dumazet <edumazet@kernel.org>
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> >  man/man7/unix.7 | 101 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 101 insertions(+)
> > 
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 67dd10cc146f..a4457508fd2a 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -316,6 +316,33 @@ and returned as the result of
> >  .BR getsockopt (2)
> >  is an integer boolean flag.
> >  .TP
> > +.BR SO_PASSPIDFD " (since Linux 6.5)"
> > +.\" commit 5e2ff6704a275be009be8979af17c52361b79b89
> 
> Why does pidfd only have SHA1 ?

I'm removing it from the code and keeping it in the commit message, as
in the other commits above.


> > @@ -367,6 +394,43 @@ stream and sequenced-packet sockets, and for
> >  .B AF_UNIX
> >  socket pairs created using
> >  .BR socketpair (2).
> > +.TP
> > +.BR SO_PEERPIDFD " (since Linux 6.5)"
> > +.\" commit 7b26952a91cf65ff1cc867a2382a8964d8c0ee7d
> > +This read-only socket option returns a new PID file descriptor
> > +(see
> > +.BR pidfd_open (2))
> > +referring to the peer process connected to this socket.
> 
> Not sure if this is worth noting here, but "peer process" is
> a bit unclear.
> 
> For example, if process A creates socekt A, calls listen(),
> and pass it to process B and close()s the fd, and process C
> creates socket C and connects to socket A, then getsockopt(C,
> SO_PEERPIDFD) will return process A, not B.

I think it is OK; The phrase "peer process connected to this socket"
is adapted from the description of SO_PEERCRED, and to clarify, the
next sentence refers to the description of SO_PEERCRED in the same
file:

> > +This is the process whose credentials are returned by
> > +.BR SO_PEERCRED .

^ Here

I think the SO_PEERCRED description is good:

  This read-only socket option returns the credentials of the peer
  process connected to this socket.  The returned credentials are
  those that were in effect at the time of the call to connect(2),
  listen(2) or sockepair(2).

(It is good, because it puts the common use case first, where the
entire BSD socket dance is done by the same process, and then
clarifies the details for the people who need them.)

So this seems fair to me, imho.  Let me know whether that seems
acceptable to you.

–Günther
