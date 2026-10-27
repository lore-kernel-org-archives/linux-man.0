Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140266;
	b=cc1vTZF/OXfLVdZ22Fqcy+nztd5ZWItDyiI+4YRQ98IOiO8M9SMxgJ25p4fZ0+gEvImh
	 hr0Ye7uNr+lJhT5/IOOzT4GRdVT/V+kMmgjCNUnYu6hpnicYbeyQMOJx6n0WdgvFab8Xz
	 jlCtSNJV66MxvPMzGoKUg3jLfXKwy/2PuwtdeikOLbpE/dovup+BtW7Z3c96+aQW+CAsi
	 aUyNqLn+2bVKn74PvOlPbYbzz57COgkUPmxYXN1SjAm5e4SRYpWDg5534Sz05BbT6Oo3J
	 bifMYderKFtsiKARqPmQc1HF8B5pum3cg6WGdFEoIhNl6ijw83PbWjuqM9po5cTmiBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=peAbFneGg1r80DzSknf2IyZ9d6pMpXDOFXkkFFnl6Sk=;
	b=d33BRBZTN6ztWj87jQ/vk570XMMUi0cytMx5fRKlhCGOiwqCl/dm6zcWi19uGboWxcKy
	 f1D+1wXh4Pl7IIPT/Gg2csXE9W5vq9SXuFeslpYaFykFJIE0+gDZJMHOqKNI0sr6hoXq8
	 jQlBngqMnNz8KdoIaThjqnkW+xjm23yhKGFllY3LFg6Bstc+9uccJfmvmyYIfEtebnUTA
	 Aa7nx9ZkzDrvBqhC1fHZavM+eIsG9euZck0mqQYjqFbQLwxl3HkvAoIr4kWheBFyzL3/k
	 PVJVtA9z/lV9oZ4y6XCLp8MXtKlQCLzcb75rF850b32MnY+Ggzh8cB1evEY/vhSPatg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wHnSFfxp;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B11D606A326
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 22:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B11D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wHnSFfxp
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso2804545e9.1
        for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 15:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140265; x=1793745065; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=peAbFneGg1r80DzSknf2IyZ9d6pMpXDOFXkkFFnl6Sk=;
        b=wHnSFfxpWBvTW1J5HbF9OwIYjBwbxAfWXOlFVFcDdl0R7hA5emDv0ImgHbXV1C87Kl
         coBgBnZNJWi9WyVatRc0546Ma9lpOiOXKKw21jnVuEX9f/5Ev0/ZwR9m7m/WZacR16OU
         HB/8KLb5z4xthQTZcQvlUp+Dd18qDuT0PFRMnBqiV5/63cYyvaxquWv3Dp+INhikWJdd
         5beSn2I9+HKRcgGZ6rl5eeY48g2NqdQ68sH+BQEA3P1z7xxYSyTLdne8QGq/aZxahlvv
         m+jdau2fvR9AxQ/g4RPM+mv+BVazQembWhoheXBwXZGSmq43W2RJvo7IFBnYtBhrWp4a
         N3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140265; x=1793745065;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=peAbFneGg1r80DzSknf2IyZ9d6pMpXDOFXkkFFnl6Sk=;
        b=jeasDF0bBQb85SrOGHFxOTfYaEfMda37sW5pXZbMdb7PC/QaGxPiCahqEFNBq9mAGT
         +F5MYrcBlIbUdCM0Vk51rIxEMIS3atEpHuljG0CRyrG4wBQjv+W53b4cbJdCFw/gpcxT
         XwB+Fbu3iAo+9Bq5fbyMVZfBEsFPkPDFqq3Ur/gedrPwSE2uCDon4iFD7UuM0T648YRN
         bPE43cFPh8eg/Zqt4NIcIY46AwZUyDjP72F0xKh/kH6DxXgUb3ojmTKVim1pgBzFUHdV
         t1dc0wl5CJYdbatQYZ7lGJ5L+m+wpSgYVTkcvLszc+1LLliY47l/bTkWKAWJwV3+hAmb
         cmpQ==
X-Gm-Message-State: AFq9FYJWv/mzCNPyzwrWqKFiyz39t2D7YzIpqxIp2vmJBCQPU8ND9Kof
	VoMa6a3p9EIsqGZFXVCt8wzQM2jzBE5+SMx0OxoDHaK5+aFYuVeou9ej
X-Gm-Gg: AYBFou1p2JcN5YYXnYQ5YvQksRhaW9nE7Z7YyEqDR1k8nSPpDVrFjtamA6bDfHzp+UI
	tZH+meiM/f/SQ/xk5nZQUlaPBs+KdOqwBWhFK/KahLYxbQT0CBrTU1a0uMnrAeUwRtDP2z31kiz
	ufdfw+SYk7JOsBKJ/mrLaJ5NgSn1j5EwsJlZ+29MoWC3nTFpsM/2FtUQI8Fa2hv1T6MKDUVgcUc
	XU7H+gIY7IGVJ7CZzDZmuNLRAMk5d7hA7i3COoVkA1iceWcDtfRU0btFzxqG/izo2HaZUAOYb0b
	O2EeCEW7PCdPAcpGY+rFgRt9RB63RA47RWQ/vvd57iv7Lvg4iL6P2CZIhzWXCXXZiroOh6E/BW2
	LwrKSiptjDBxDyQdR2NreeEmEXSBc179dFXjWHbxijmkXOi83Skz+Z9k6em1vFytEvGaU4+Qb2Z
	7c66AYSvEvdw0aWLdHptZS5uykWEo30K6FeeYhWAKjowXbgO5g59Ql8ESWKG1hN+820xfvltUcv
	hbeHHLunm8NELLWMDayBkogvOsGTsIOb856Z0c9RY5X81bVFk3Evw/VsJE0f4FiC2qS7R4yWpei
	6SWq
X-Received: by 2002:a05:600c:609b:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4a965ec941cmr6084085e9.7.1793140264748;
        Tue, 27 Oct 2026 15:31:04 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm19643426f8f.40.2026.10.27.15.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:31:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 23:30:59 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <20261027.421170835581@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
 <auEa_2LQFAD023tR@devuan>
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
In-Reply-To: <auEa_2LQFAD023tR@devuan>

Hello Alejandro!

On Tue, Oct 27, 2026 at 10:46:14PM +0100, Alejandro Colomar wrote:
> > Date: 2026-10-27 09:54:51+0100
> > From: Günther Noack <gnoack3000@gmail.com>
> >
> > On Mon, Oct 26, 2026 at 11:41:13PM +0100, Günther Noack wrote:
> > > I'm still leaning towards documenting it as a buffer with
> > > implementation-defined contents which are provided by a LSM.  How
> > > these buffer contents are interpreted is depending on the LSM in use
> > > anyway.
> > 
> > To make a more concrete and constructive wording proposal:
> > 
> > 
> > SCM_SECURITY
> > 
> >   Receive the security context (the security label) of the peer
> >   socket, as provided by the active Linux Security Module (LSM).  The
> >   received ancillary data is a byte buffer.
> > 
> >   The exact format of the security context buffer is defined by the
> >   active major LSM.  For example, SELinux returns a SELinux label as a
> >   string (including a terminating null byte).
> 
> Let's pause the discussion of the specific text for now.
> 
> I have questions about the exact format used by each LSM.  For example,
> you say that SELinux guarantees a string.  Does it count the '\0' as
> part of the data size?  Or is it guaranteed to exist but not counted?
> 
> Same question for the other LSMs.

Yes, SELinux counts the '\0' as part of the buffer size for the
SCM_SECURITY security context.

Examples:
* If the label is "foo", it'll return {'f', 'o', 'o', '\0'} with payload size 4.
* If the reader calls recvmsg() but preallocates too little space in
  the msg_control buffer, this can get truncated though, and then it
  won't end with '\0':
  {'e', 'x', 'a', 'm', 'p'} with payload size 5 (truncated)


Other LSMs:

* Smack excludes the null byte for SCM_SECURITY (smack_to_secctx())
  (but irritatingly it does count the null byte when a label is
  returned through SO_PEERSEC (smack_socket_getpeersec_stream()).
  Both functions are in security/smack/smack_lsm.c.

* AppArmor excludes the null byte for SCM_SECURITY as well.
  Implementation is in apparmor_label_to_secctx(), where it populates
  the struct lsm_context *cp using:

    len = aa_label_asxprint(&cp->context...)

  and then sets

    cp->len = len;

  The function aa_label_asxprint() returns the length without trailing
  null byte, as can be seen in its implementation.

SELinux, Smack and AppArmor are the only LSMs that implement the
secid_to_secctx() hook, which is the hook that defines the payload
contents.  (For reference, the higher level common SCM logic like the
truncation is in net/core/scm.c.)

All reasoning is based on reading the code (with some AI assistance to
point me to the right places). I have not tried it out in a running
system, but it seems to check out.

–Günther
