Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778252;
	b=bIXHfbzdMIBeGuzuRE5pGHPVZ+RaRc3XJXt5GMqUVX9YQPJCpUQRFilxoJEM4Y0zd0Aj
	 OTpD8iugDhrh0d91YHNt83D/QAprkzOaDGUwyC3E0gJQxsm8Q/kfAOFwZlwKepuz0g9Ij
	 DT6rzsYL8lcnsKs4FYYtb0Pmc4o8Cl4uAwQFq+kcPDLCQ0Sre7gAH+c5nKAMWdGbPOhTD
	 kfHh2oAuNWpm6qj+sD2i2v2BiudifXr8xUBvyrucrFuQlnv1yOSLSkQrBWh9Vx9L/+O2C
	 VCkMvluYGFh7Wpnd9hBCVFrlYzUWJ/Y/yCD+6dMr2w4gjXP93eofGX6UqNYG89SKxCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Ix0Of6doNLiEXS7KmXbWI8rORBfX0dbFFeqt3Phrkyw=;
	b=tjfn2hrptS48NtSUuoK9mpnv+OOa2Vvj4cogLXgIOVu4f2PK75OYnvISgDAna1oyj1dk
	 LTV17I9RtpRRkoTh+4cPiWg+roAnZbksHgvI9nO9iIZM3KanGvZQ8VmHF2v80wOx+T4O4
	 69mkcOmoHsQVA4rwB4skbc1H+OBPAJztwUd+GQ42giUDf/iTsGrVk2Jrv7d5krWkS7RwP
	 K3JxujD4S/WqU/DoS9chx/KYBzoz1kHok4C//I7xSkjRDWS+W2ZxLd2fn5aYor3+COR/w
	 atxzWTFCtX2NKB5dfUC2uk8A7ysl0E6O0myZxlTrqIb5UNUJCR1oxum9noebLChx3Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c9Pvb6NE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC28F606A31E
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 17:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC28F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c9Pvb6NE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1442705e9.2
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 10:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778250; x=1793383050; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ix0Of6doNLiEXS7KmXbWI8rORBfX0dbFFeqt3Phrkyw=;
        b=c9Pvb6NETODgmoJR3mQVGS93LSdFVDOlUSgBp9q0xdY/cz0jhKJHROLnm+uF7tK/28
         MikmiGwEKCrcfnmN+Lnc7ixwH1SMeJLUSWzK3p3v9CQ0BipQ5gbVXstzRDBgcKsWFtpj
         dIZgGpXiM2e1M6lZZu6odCptDi03JrLQLt0DXqQyuSIcZf+h64x4brAioVSYRJb+B7GU
         PlCU3v/OqNGpHiEFIUPVu47m4XGsZctAmQ6AUiHEBZkUVSVoGmMwdNMU+9qBfk1e9llD
         p7nofdOMgeosoMcrXaAMNV0LMNaeJO4Q6hmhuT78j2oSVbDKqDjDA8FWnxQWDTBjmaNe
         8uUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778250; x=1793383050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ix0Of6doNLiEXS7KmXbWI8rORBfX0dbFFeqt3Phrkyw=;
        b=asIDDyTFjfSsAeqQoRgIGcqCeKd+uM+1WPTVMgq8J1C4/hb8xZyedagvaWT+Pt/ags
         0XjmuLMQGvU7Jwu6sUnpdJbw3ZMkK7YKSVH6vP4KjRyjcs/FSj7AjqIyW04XKtHpcaQq
         SnajZWe/UY2vQaydH3YNnmrxfSxZsKgH3bqgOoPpX5tryHn0GzHE+I3MsXodXjYLhVpT
         49cbwb6SvO7T9fD6P/q0USCTovS++1BECvVcwnpj/xELZc1ip7So4oI+N1B9m2sOh0kZ
         ud5TsbwV8TY0DOTQ/IgnOt0K/bivZ8ereTzH3Pv09zMKVrckwTAvmVLg+/vvNNhoqPjS
         BHqw==
X-Gm-Message-State: AFq9FYL20vm03ElXfYcHMXsDq9fqbvZ2JiGBAw98PrcM8mggPv1Vlm1H
	5ujruOkqFfUtjmy6UQwRuk4SdNkxSusPvrURgQ+h9izyTWIZWj4FrkGFw5Q0VcRS
X-Gm-Gg: AYBFou3NfRC5/l8bkJFek1IQhL/OfIIBdyq2GFcwx75ETkxditQ50Kgvh6eeJNE3F0F
	nAwiFG3LCxus4IY8RdpSvDiVb5sq1wOQADR+0VCOrjwzLJVqzqg9uqjXVR+YPv33/dasC/wq5rx
	UfoDMTUCGgQut/BI1sAUNNVADdcqf5VD4bBpk+f3f4zYuJd8kdGPLAyYpi0Jt4VrMRGmE37qOIF
	mmv5+UdokBv0BGtBe7tBMfQ0iVzE5tnxE/EMlEmLbov0mKVak1bBD2eAXiEdDuWkkBOjSt69oNO
	wp2yvYI4zH/6kZAYMLA+rPv4irtCB9JK16gsXipiHjzjNtKX0LsUy6XwWSe9UuYrgaiwmmkKAlN
	TQmP+IiurLe5PTTJOCltiBv8vHVzq7UqUdRpFeukoSmi1S/Z2IyMbOs/YMj6bY7xGJmbsY3bhI2
	3QqlrHgOSmpZuX7wbwmgYlNVdfB7BLl0MypuX+yhVCdHlzZHZIVU1p02TOZRMoe4MhpNam2L3J+
	7wOPCW2okyHPGOckKMJUkJXJqAB/4NKcn45/CvFWlM6nKxExJFNprAPPGKjIyvj562Vy7cEwNFd
	FqnZ
X-Received: by 2002:a05:600c:a403:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a211dd987dmr44499035e9.16.1792778249952;
        Fri, 23 Oct 2026 10:57:29 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cd9d09csm21074945e9.5.2026.10.23.10.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:57:29 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:57:16 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <20261023.63aab80a9e86@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
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
In-Reply-To: <atsufiZwUg3d-cKs@debian>

Hello Alejandro!

On Fri, Oct 23, 2026 at 11:57:41AM +0200, Alejandro Colomar wrote:
> > Date: 2026-10-21 23:22:53+0200
> > From: Günther Noack <gnoack3000@gmail.com>
> >
> > Reword the description of SCM_SECURITY to not be specific to SELinux.
> > 
> > The security context is populated in scm_passec() in linux.git
> > net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
> > is currently implemented by SELinux, Smack and AppArmor.
> > 
> > Also clarify the properties of the returned string:
> > 
> > * There is no NAME_MAX limit on the length; SELinux contexts can be
> >   longer than that.  If the control buffer is too small, put_cmsg()
> >   truncates the data and sets MSG_CTRUNC.
> > 
> > * Whether the string is null-terminated also depends on the LSM:
> >   SELinux includes the null byte in the length, but smack_to_secctx()
> >   in security/smack/smack_lsm.c uses strlen() and doesn't.
> 
> ...

Ah, I can see that this is confusing; let me reformulate that without
mentioning this strlen() implementation detail.  Smack returns a
buffer with a given size *without* including the null byte, roughly
like this (simplified):

  int len = strlen(skp->smk_known);
  /* populate */
  cp->context = skp->smk_known;
  cp->len = len;    <-- does not span the null byte

Reformulating to:

  ...but smack_to_secctx() in security/smack/smack_lsm.c sends a
  security context that does not end in a null byte.

> > Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary data")
> > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> > 
> > Notes:
> >     This feature is also available in other LSMs.  Unfortunately, they
> >     implemented it inconsistently and that complicates the description of
> >     how string boundaries are handled.  Linux does indeed neither
> >     guarantee that this terminates with a NUL byte, nor that NAME_MAX is
> >     large enough to hold it.
> 
> ...
> 
> >     
> >     This is the verbose variant, but I am open for suggestions regarding
> >     what level of detail is appropriate here.
> > 
> >  man/man7/unix.7 | 25 +++++++++++++++++++------
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> > 
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index ded82768322b..4abd216d19c7 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -317,7 +317,7 @@ and returned as the result of
> >  is an integer boolean flag.
> >  .TP
> >  .B SO_PASSSEC
> > -Enables receiving of the SELinux security label of the peer socket
> > +Enables receiving of the security label of the peer socket
> >  in an ancillary message of type
> >  .B SCM_SECURITY
> >  (see below).
> > @@ -544,13 +544,26 @@ message, the
> >  option must be enabled on the socket.
> >  .TP
> >  .B SCM_SECURITY
> > -Receive the SELinux security context (the security label)
> > -of the peer socket.
> > -The received ancillary data is a null-terminated string containing
> > +Receive the security context (the security label)
> > +of the peer socket,
> > +as provided by the active Linux Security Module (LSM),
> > +such as SELinux or Smack.
> > +The received ancillary data is a string containing
> >  the security context.
> > -The receiver should allocate at least
> > +Whether the string includes a terminating null byte
> > +depends on the LSM;
> 
> This seems to contradict the commit message.  The commit message says
> that the string is terminated, but that the reported length might or
> might not be off-by-one (i.e., not count or count the '\0').
>
> This text, however, is saying that in some cases there might not be
> a '\0' at all.

The TL;DR is that the byte after the returned buffer's declared length
can't be trusted to be 0 - it is undefined and can be clobbered.

I have not read the full kernel implementation now, but it can already
be seen in userspace that that adjacent byte can belong to a different
data structue:


## How control messages are represented

The security context is returned to user space as a cmsghdr structure,
as described in cmsg(3), where it is returned as a buffer of length
cmsg_len:

struct cmsghdr {
	size_t cmsg_len;  /* data byte count including header */
        /* some other fields */

	/* followed by
           unsigned char cmsg_data[]; */
};

Reading beyond the declared cmsg_len is undefined, and callers don't
get any guarantees about the byte following the csmg_data[] buffer.


## Iterating from userspace through multiple control messages

Iterating through the cmsgs is done with the API described in cmsg(3),
CMSG_NXTHDR().  This is implemented as an inlined function in
/usr/include/bits/socket.h.  The function does a bunch of validation
logic and then ends in this rather simple advancement logic:

  __cmsg = (struct cmsghdr *) ((unsigned char *) __cmsg
                               + CMSG_ALIGN (__cmsg->cmsg_len));
  return __cmsg;

So, the cmsgs with their cmsg_data[] buffers are next to each other in
memory.  They are aligned, but that still means that the byte after
cmsg_data[] might be part of the next cmsg header or beyond the list
of control messages.

---


The more I think about this, the more unsure I am that this is even
worth documenting.  In the end, anyone reading and interpreting this
data probably needs to read the corresponding LSM anyway, and trailing
null bytes are probably the least of their worries...?

Maybe it would be better to just say something like "The format of the
security context is determined by the LSM responsible for it".  WDYT?

–Günther
