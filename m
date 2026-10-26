Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054477;
	b=Fw4YbPRd98imeposyKqEoJgId1NicXXfRape9cuJPxqImj2xX217YND8rQxSz4YZJ8Pi
	 RfXuF78aGXg+ns3KsqouRWHZVpFixU9HIc9c8rc5zdlcVbfrOV7g4SakH0EgAFWBFNOT/
	 ClBf7MTnf7LtW4MejMizOy7XMKKEjjXRiHtFfyH/ArmlhuK+ySIBtKIMNAG9TD5TPbXcr
	 /TX54lTaIt5S+sdOMwASg5oEuMMAVWDPrkNWAHBT1rmjclGd3+Rf7H6n4DOoGVds9sdP4
	 I7s78HXwFDRPlHJrke27eRaK+fIX3a1+UnC4XGEuF4jVuFz/pwY/zyUXvvpmCsKIrCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=nFrJWvBdgFTPW1K2yN0oMSYF15BGhSl8do1MVRTtUUQ=;
	b=MdZpM6F2y83e0DY57Vf311IGJ/qG1tEOGpsVij9xOTLs9HSyTEGtGjgUZujJpp6wVWZK
	 UPTWzfYHApTi6zTTktp1cTXt9qBAE6Uien8Vs+oWN+PN9idOf42/h1VAjWMaeoo4YdkYG
	 Hk4T4cXYj/t7jCN+bVLwbTQqnrpXgk3anFqmmSxkegss7FNZh9FQK6uuVzfP4v+NS7JDq
	 eC9zNaYXIl73UEQ433nYy/bXVmusDCcaOTZ82Z7zPKv2D4T0YyUh4kMBijWlozGwwOKvK
	 h6K8A6UghjG/bc1wizlRE2dpaBfkgBhAdXUkG7muZOUkHR0BmYST30+2/AzhvqYKZZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sOMYoIaV;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3AA606A333
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 22:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3AA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sOMYoIaV
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso21886075e9.0
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 15:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793054476; x=1793659276; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nFrJWvBdgFTPW1K2yN0oMSYF15BGhSl8do1MVRTtUUQ=;
        b=sOMYoIaVEHxzsvJbCmQu1C/NusKe1t9bfXZ/tVzSmNfSegbG0C3ZeYrYINEFU2wcWP
         s+Z01ZxP/oFZByAfyWioClUoz+NV7vmY5VgkX5SkNxBXsQd6GOvZp26ys2xSsTosbb34
         bIF0D+0Zv42ac8kXCJ/YKNWMPpKs22LTIwxnZIrAVIiqDbOunawxINwvIIkPtijSuFXd
         OZD6piSlYirfIZT6nn0F8JrYLsppgcX756o6wPYuwRka2S6h+FvYsbcWj/SUQDRm12SQ
         vNJZXn9kthL4BKxms4D9L9oSBgfQvTzlel1IokiMFJuZuBQO0zWCVlaLuG2+lv+ocW8W
         oc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054476; x=1793659276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nFrJWvBdgFTPW1K2yN0oMSYF15BGhSl8do1MVRTtUUQ=;
        b=laG3/eoUpoloqAVHP78eqBhcB6lG4VogQRP/doswYr1+I5LbSA7YJlIUKZ5MeAD4y6
         C4lKCNHGgZ1mJDB/BxjgXwKcWg4WOoMLp5zL9zG9DotAhMhmbEHpswlvvzSo4kVt9jXA
         YxX/C8OOrMxPlYSaews404oMmnyZPQ49m5Qnjc6SkPSq4mBNh2TmPmrCNNJ2Ca53Fcgl
         +co48OJKVFvSq3BlYW+EjOjtf5lE2FbPicOB7HGSbJqr4qHocFFHKQeAn+L/r+NeHyGC
         OBpEis0x5xfEIXVcCYn6MXznsSjgEwXlKs5zOT+LQcIJqhPRJPFrl5njTQ1E5aIBi80g
         InxA==
X-Gm-Message-State: AFq9FYK13vmAAFn26+NlRkoI/XaeeBSMVhzPg03t2isF77aSh1kNX5si
	kbhxxnbxR/7kI/a/1R/f+KmXsWrbgQ7nJyka1EjRVoqtXicU1NEoq4WJ
X-Gm-Gg: AYBFou1y60Hvo6WzfjCdlpqFTw0YcWk0MZQkkB/9Tm6SCkaWIwPL8o76R5LMrGwT3pW
	LfAK/mXXR8fBuw4Rl88YfNnJbxCJ3+Bf7/dfhWH962VVevWlPvKXAiE+19d3t9TR838zGDi92cv
	KSNMuRRNj7XG/d4L/BXOAs/QvrILyNltTDQm0mkyL4DvhZDabVEm6BqMFwch3KlNQEjRphlMSuS
	7S3IrfpxcYse11cKNjOZO2eE4baRxsHyaD7rsQFFaMVbR3I/LhvUUHAsbrCZxOD2/m1sA7ga0os
	Vc2ZXEP6hV8ehGTdiJfQh9fFJe3zi7CeM/HAd1f4MezW8DGKOuvUbuOlhXfvaEzBcVtkee4a46N
	EwKbICpE0kzorFXnW1kpnzx/S5G/9HZqpmEMmfunMgM4FqJs4U9GS7iTG0xaZ2kN38g8/DMMKn4
	Ho5jj5SgGcj91sbERaa1ph6SfFYXJNHUQNurHdBZJgn+D7CiMIMijF9eLtIdHKRHR1/AvDaSCKt
	cULRlysQ79+ukt8NMJAtPwAaQsMhaMXTvqm+0zyXpANd247kjRtgSJPAGQUky2jKlw5g3rJYeol
	Yo5w
X-Received: by 2002:a05:600c:530e:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a35acbee85mr151238105e9.26.1793054475551;
        Mon, 26 Oct 2026 15:41:15 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm273835265e9.7.2026.10.26.15.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:41:15 -0700 (PDT)
Date: Mon, 26 Oct 2026 23:41:13 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <20261026.f6d2e191a08e@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
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
In-Reply-To: <atuiuCDEpf7H7I7J@debian>

Hello Alejandro, Casey!

On Fri, Oct 23, 2026 at 08:13:22PM +0200, Alejandro Colomar wrote:
> > Date: 2026-10-23 19:57:16+0200
> > From: Günther Noack <gnoack3000@gmail.com>
> > On Fri, Oct 23, 2026 at 11:57:41AM +0200, Alejandro Colomar wrote:
> > > > Date: 2026-10-21 23:22:53+0200
> > > > From: Günther Noack <gnoack3000@gmail.com>
> > > >
> > > > Reword the description of SCM_SECURITY to not be specific to SELinux.
> > > > 
> > > > The security context is populated in scm_passec() in linux.git
> > > > net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
> > > > is currently implemented by SELinux, Smack and AppArmor.
> > > > 
> > > > Also clarify the properties of the returned string:
> > > > 
> > > > * There is no NAME_MAX limit on the length; SELinux contexts can be
> > > >   longer than that.  If the control buffer is too small, put_cmsg()
> > > >   truncates the data and sets MSG_CTRUNC.
> > > > 
> > > > * Whether the string is null-terminated also depends on the LSM:
> > > >   SELinux includes the null byte in the length, but smack_to_secctx()
> > > >   in security/smack/smack_lsm.c uses strlen() and doesn't.
> > > 
> > > ...
> > 
> > Ah, I can see that this is confusing; let me reformulate that without
> > mentioning this strlen() implementation detail.  Smack returns a
> > buffer with a given size *without* including the null byte, roughly
> > like this (simplified):
> > 
> >   int len = strlen(skp->smk_known);
> >   /* populate */
> >   cp->context = skp->smk_known;
> >   cp->len = len;    <-- does not span the null byte
> > 
> > Reformulating to:
> > 
> >   ...but smack_to_secctx() in security/smack/smack_lsm.c sends a
> >   security context that does not end in a null byte.
> > 
> > > > Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary data")
> > > > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > > > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > > > Assisted-by: LLM
> > > > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > > > ---
> > > > 
> > > > Notes:
> > > >     This feature is also available in other LSMs.  Unfortunately, they
> > > >     implemented it inconsistently and that complicates the description of
> > > >     how string boundaries are handled.  Linux does indeed neither
> > > >     guarantee that this terminates with a NUL byte, nor that NAME_MAX is
> > > >     large enough to hold it.
> > > 
> > > ...
> > > 
> > > >     
> > > >     This is the verbose variant, but I am open for suggestions regarding
> > > >     what level of detail is appropriate here.
> > > > 
> > > >  man/man7/unix.7 | 25 +++++++++++++++++++------
> > > >  1 file changed, 19 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > > > index ded82768322b..4abd216d19c7 100644
> > > > --- a/man/man7/unix.7
> > > > +++ b/man/man7/unix.7
> > > > @@ -317,7 +317,7 @@ and returned as the result of
> > > >  is an integer boolean flag.
> > > >  .TP
> > > >  .B SO_PASSSEC
> > > > -Enables receiving of the SELinux security label of the peer socket
> > > > +Enables receiving of the security label of the peer socket
> > > >  in an ancillary message of type
> > > >  .B SCM_SECURITY
> > > >  (see below).
> > > > @@ -544,13 +544,26 @@ message, the
> > > >  option must be enabled on the socket.
> > > >  .TP
> > > >  .B SCM_SECURITY
> > > > -Receive the SELinux security context (the security label)
> > > > -of the peer socket.
> > > > -The received ancillary data is a null-terminated string containing
> > > > +Receive the security context (the security label)
> > > > +of the peer socket,
> > > > +as provided by the active Linux Security Module (LSM),
> > > > +such as SELinux or Smack.
> > > > +The received ancillary data is a string containing
> > > >  the security context.
> > > > -The receiver should allocate at least
> > > > +Whether the string includes a terminating null byte
> > > > +depends on the LSM;
> > > 
> > > This seems to contradict the commit message.  The commit message says
> > > that the string is terminated, but that the reported length might or
> > > might not be off-by-one (i.e., not count or count the '\0').
> > >
> > > This text, however, is saying that in some cases there might not be
> > > a '\0' at all.
> > 
> > The TL;DR is that the byte after the returned buffer's declared length
> > can't be trusted to be 0 - it is undefined and can be clobbered.
> 
> Huh!  This is to me a bug.  Would you mind reporting them this as a bug
> and CCing me?  I'd rather get this fixed in the kernel than documented
> as broken.
> 
> Especially, if they use strlen(3) internally, this sounds very much like
> a kernel bug, but even if not, it is clearly a kernel bug.
> 
> In any case, if we were to document this bug, we should not use the term
> string, because anything not containing a '\0' is not a string, by
> definition.

Casey, would you be able to confirm whether this constitutes a Smack
bug or is intentional?

The TL;DR is that we came across the function smack_to_secctx() in
smack_lsm.c, which passes a Smack label string in a buffer without a
terminating null byte.  This is inconsistent with what SELinux and
AppArmor do.

Before we start explaining so many corner cases in the man pages, I
wanted to check -- is this something that Smack should fix, by
including the zero byte?

I tried to double check the Smack userspace utilities but couldn't
find any use of SCM_SECURITY there.  (Is the feature unused?)


> > I have not read the full kernel implementation now, but it can already
> > be seen in userspace that that adjacent byte can belong to a different
> > data structue:
> > 
> > 
> > ## How control messages are represented
> > 
> > The security context is returned to user space as a cmsghdr structure,
> > as described in cmsg(3), where it is returned as a buffer of length
> > cmsg_len:
> > 
> > struct cmsghdr {
> > 	size_t cmsg_len;  /* data byte count including header */
> >         /* some other fields */
> > 
> > 	/* followed by
> >            unsigned char cmsg_data[]; */
> > };
> > 
> > Reading beyond the declared cmsg_len is undefined, and callers don't
> > get any guarantees about the byte following the csmg_data[] buffer.
> > 
> > 
> > ## Iterating from userspace through multiple control messages
> > 
> > Iterating through the cmsgs is done with the API described in cmsg(3),
> > CMSG_NXTHDR().  This is implemented as an inlined function in
> > /usr/include/bits/socket.h.  The function does a bunch of validation
> > logic and then ends in this rather simple advancement logic:
> > 
> >   __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
> >                                + CMSG_ALIGN (__cmsg->cmsg_len));
> >   return __cmsg;
> > 
> > So, the cmsgs with their cmsg_data[] buffers are next to each other in
> > memory.  They are aligned, but that still means that the byte after
> > cmsg_data[] might be part of the next cmsg header or beyond the list
> > of control messages.
> > 
> > ---
> > 
> > 
> > The more I think about this, the more unsure I am that this is even
> > worth documenting.  In the end, anyone reading and interpreting this
> > data probably needs to read the corresponding LSM anyway, and trailing
> > null bytes are probably the least of their worries...?
> 
> Not only that it's worth documenting, but this might be a vulnerability.

> > Maybe it would be better to just say something like "The format of the
> > security context is determined by the LSM responsible for it".  WDYT?
> 
> I'm unwilling to accept a nonstring as a valid format, unless very good
> reasons are stated.  And if those reasons are stated as "that ship
> sailed long ago", the way to document this might very well be BUGS.

Point taken and agreed that it would be better to call it a "buffer"
rather than a "string" when it does not have the null terminator.

It does seem that this is used also outside of UNIX Domain Sockets:
IP_PASSSEC(2const) says:

  The security context returned in the SCM_SECURITY ancillary message
  is of the same format as the one described in SO_PEERSEC(2const).

And looking this format up in SO_PEERSEC(2const), we find:

  The security context string may include a terminating null character
  in the returned length, but is not guaranteed to do so: a security
  context "foo" might be represented as either {'f','o','o'} of length
  3 or {'f','o','o','\0'} of length 4, which are considered to be
  interchangeable.  The string is printable, does not contain non-
  terminating null characters, and is in an unspecified encoding (in
  particular, it is not guaranteed to be ASCII or UTF-8).

So it seems that these "buffer" (not "string") semantics exist there
as well.  Maybe it is intentional then that it is treated as a buffer
rather than a string?


I'm still leaning towards documenting it as a buffer with
implementation-defined contents which are provided by a LSM.  How
these buffer contents are interpreted is depending on the LSM in use
anyway.

–Günther
