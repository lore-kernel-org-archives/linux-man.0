Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184274;
	b=R5C/MFFODlFSRes7sW+Dupys1MhkLKXIPvaXuWZq6XahDH1QR4hMvT7Alc6TEH7nZhZt
	 gwImE26Zjh9X9E0kD4mRl8IqsXjawLxYzt8Zo7vvmRfgpG5eztBGToMCEWW1XyxdcciW6
	 Nk2A/S5UQWgbLIRGkhnGLARxck95a0lTgVyeO2K2X6Qhi84c8anUbsGX0y8B264HgdlEo
	 yO/4sE5c5wZLVJ2WPpracIFFGXJuArptHfpnzLz2cVKonZN1zls0uu/KzP4rTpLoJWaHJ
	 7iwnDTp8vMF1BqBFcBeaQpIqVHE1vA3JI+LBC34WhncgvplFblyux73UtyUYGXgzLOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=aBkA+2cSGNE4IyctVEQACzQH14etmyhS0s0tE853PcU=;
	b=ullWgYvGYulrBN5SkIjBEVqBXImZ1e3cTQS0p5lrIg6hpyCgUf5/lesQcwC7Wlwrqk77
	 ZrOln1iPuHx3TzY2KwFYPIIXCGZGt1AfJimduNBbLtTQxEQMOi/9nzeQb7t5E3Y2PygN0
	 wz6BdtaFgirLzelyo4wAGsI+DPhGVDqnJH2ABgkoufH2DtELAOJR24d9KuP5qqnuYlHey
	 0WSh7d2iLk01npOigCYVsaDBffrb13kMMdmPMP1e4Sxo04i32/TDP5sFAWYsdt7CAZPcI
	 E9tEsKCIDCKDR/9Li0hpUnhlyADNdYWcweDPL4wS6KheUiu8X8p6eZY2Sf+ql3F2rZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjGnSKOk;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBB606A320
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 14:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2EBB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjGnSKOk
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so11202475e9.1
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 06:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184272; x=1795789072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBkA+2cSGNE4IyctVEQACzQH14etmyhS0s0tE853PcU=;
        b=TjGnSKOk4QAZ+jTeKMBHjWBTQeSSHVZ3GkXOUFyk/Vb4WHyx26xB0VU1JQ3MY5zrF/
         JzrhqUJvIt0ykvlf2Cv2frmJ1HVRDOwZYL7pk9rFqLDJ7PS15K492FyfGbVMLFOYyp9O
         EQb6Q/LFPDIht9YM6BvdPmrkmbYsrgEbUHTSI9aCSVRlOoLb4AYHF5NTIBVryVepAmNJ
         y7L0lSmCZTH0YKT9XHA/aoJLXwOVjOQYScz9Y/AvIonCkFOV/F2gcFnn8xu4aQV+uT6J
         HdpZactYWhVnWldyRh1Jarl8f90fI/qy8Zzix2SMgma3qrKz0OdZPvR/17cklRo7Y9c5
         Va6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184272; x=1795789072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aBkA+2cSGNE4IyctVEQACzQH14etmyhS0s0tE853PcU=;
        b=CLJkRWYUB+j3nyf3EkWM7Ai2p577ftniQGMbYasMbsFnlyhcf+OhWzP5gyWzC9CKUl
         m+n71K6CH5mLA3lMMUyM6zuZLuzb3SXBB0/tHOC/z7CNucrTxCbuC9Ha4jv4Sk8bmFcV
         sLiqjynI2T3QPxGCzrwi7tPlAgKA/xaLZOLkuEOktTNFF4k9OHmDeoOV1KpO8/IUtyzn
         DgI+sXhlglFYE2gd+c3g6MHPNqIJs0Leigzrs/IkQILht+YxnEXRlt310mG8r/5qROLs
         HzkmElaZHIGQXc8SBFl6X4jsKYlJtpyZ9NAKqOXln2x2TCee6VyUThK85pcWyRId1bGC
         R+nA==
X-Forwarded-Encrypted: i=1; AL+hErHugQUnQ9nKqfhHDTazNItEz8f0Mu6c+1k1zyUXdreyEC1yBtFAEZ4uZVZQZCrkvr909See1vrenfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OQNOWDQ2u+++eIyIhAdfVkLoHT+zh0mtNEmvCWVLkZTBQKanL
	bTth0Jp8kZ3zhsMo8LQND95nt9MSkFjnbqlpNNb4Wu5AKlVV+4ZYGYZi
X-Gm-Gg: AYBFou16G9MPfWmnXTMJhZjnVuaJ9gGy4j22N+Myc2OkVMGk/KfLZkWHnbdxINcrN4m
	QTl757ikifEZIiDKHgPkuOt2BZFpdZ2wauM5wYSpSbqRCtcH2DIC76lVFybpdzFr0tkwDwfGMvF
	1LWth0vc1jZ0ZarHslkJjPms5jHiVvSzyMCSLgUI3Cgo6tBpQPMARl0KSiX2d7tCJXfkjEpqBLo
	Hd9ei/4nQvacVgCu0f1Fy8xm/6E6IUqC78sSxkXqXd/IuFxjc0R915fsuBowNqmaYYwGgfVaLpY
	zfrxb82BCZNsNdPZNRTxxSsJRDHmGxCW4wnifCUjx8fKVgYa81WdQOovUpq3E/e0ZUevujHx3Se
	ruZzkR13ZsxoKaGYzY4eIWTT6ixTKg6Ud/Jge9j56t9sINHDhEPjQNjsO/Sw+sA5WbJyc1wpKRq
	bEaSeHXUANfbq3SSe1G32jY5ON0Wi1PKBiPpBUb71ztdVhL54clajPMHN0eGnD/o1KzXcSrmtcU
	vZnsDXPGDp/gX5brV2/ELkSjuI2GIhDTUj55MLrcOnYUDQInHj8W5YPhnspKQq/H33jHyRxI7Z4
	F5Sp+I4075WViyknsBFpgvr0go4g9LuyqL77eq5LHqPpBcffgPkf7w==
X-Received: by 2002:a05:600c:820e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb887c9936mr79754755e9.1.1795184271973;
        Fri, 20 Nov 2026 06:17:51 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm104774825e9.6.2026.11.20.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:17:51 -0800 (PST)
Date: Fri, 20 Nov 2026 15:17:46 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <20261120.790f70cab7b5@gnoack.org>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
 <avz6f7OyIVCKusQ3@devuan>
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
In-Reply-To: <avz6f7OyIVCKusQ3@devuan>

On Wed, Nov 18, 2026 at 02:13:40AM +0100, Alejandro Colomar wrote:
> Hi Günther,
> 
> > Date: 2026-11-03 21:22:06+0100
> > From: Günther Noack <gnoack3000@gmail.com>
> >
> > Reword the description of SCM_SECURITY to not be specific to SELinux.
> > 
> > The security context is populated in scm_passec() in linux.git
> > net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
> > is currently implemented by SELinux, Smack and AppArmor.
> > 
> > As clarified in [1], the returned security context is in the general
> > case a byte buffer, not a null-terminated string.  The only LSM that
> > returns a buffer with trailing null byte is SELinux, but even that is
> > not guaranteed in case that the message is truncated.
> > 
> > Link: [1] <https://lore.kernel.org/all/auZcwYWv0NeiIR8d@google.com/>
> > Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary data")
> > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Cc: Eric Dumazet <edumazet@kernel.org>
> > Cc: Paolo Abeni <pabeni@redhat.com>
> > Cc: Willem de Bruijn <willemb@google.com>
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
> >     
> >     After confirmation from Kuniyuki Iwashima, this documents it as
> >     returning a byte buffer.
> >     
> >     I prefer this variant over the previous longer one, also because it
> >     refers to the individual LSMs for the exact format.  A reader of the
> >     security context will require LSM-specific documentation anyway to
> >     interpret the security context.
> >     
> >     This patch is still LLM-assisted, but at this point, since everything
> >     is rewritten now, the only LLM-assisted part is the discovery that
> >     this part of the documentation could be improved.
> 
> You may use 'Reported-by: LLM' for distinguishing such cases.

Thanks, done.

(Minor remark, btw; I have carried the Assisted-by: LLM convention
over from the Linux kernel, but they have phased that practice out now
and removed that convention from the guidelines.)


> >  man/man7/unix.7 | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> > 
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 61f06a74359b..c0e2bdbacdd8 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -312,7 +312,7 @@ .SS Socket options
> >  is an integer boolean flag.
> >  .TP
> >  .B SO_PASSSEC
> > -Enables receiving of the SELinux security label of the peer socket
> > +Enables receiving of the security label of the peer socket
> >  in an ancillary message of type
> >  .B SCM_SECURITY
> >  (see below).
> > @@ -538,13 +538,16 @@ .SS Ancillary messages
> >  option must be enabled on the socket.
> >  .TP
> >  .B SCM_SECURITY
> > -Receive the SELinux security context (the security label)
> > -of the peer socket.
> > -The received ancillary data is a null-terminated string containing
> > -the security context.
> > -The receiver should allocate at least
> > -.B NAME_MAX
> > -bytes in the data portion of the ancillary message for this data.
> > +Receive the security context (the security label)
> > +of the peer socket,
> > +as provided by the active Linux Security Module (LSM).
> > +The received ancillary data is a byte buffer.
> > +.IP
> > +The exact format of the security context buffer
> > +is defined by the active major LSM.
> > +For example,
> > +SELinux returns a SELinux label as a string
> > +(including a terminating null byte).
> 
> Considering that the interface doesn't promise to respect the null byte
> written by SELinux, I think I'd entirely remove this example, and
> instead focus on disclaiming that regardless of the format, the buffer
> is truncated in a way that destroys the format.
> 
> I'm not an expert of this feature (actually, never used it at all), so
> maybe some silly question:
> 
> How is a user supposed to know how much space to provide to prevent this
> problematic truncation?  Is there a buffer size that will guarantee no
> truncation?  If so, we should instruct programmers to use it.  And if
> there's no possible size that fits all, we should probably warn about
> it.

The required space for the buffers is again dependent on LSM; in some
LSMs, the buffer can (theoretically) be unbounded, but it's possible
that you can calculate a maximum size if you understand how these LSMs
are configured...

I removed the example and will point out that truncation may happen in
a buffer-unaware format, if the caller-nprovided buffer is not large
enough.

Thanks for the review!
–Günther
