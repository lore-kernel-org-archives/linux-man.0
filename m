Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7FA4CDDEA
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335427; cv=none; b=izw47qWPw6Q3+HR0wUNgFMqYAlcUvBwtCo0ZjqQxeHQaxcURyi0bU45Nxfbu36gAVYe52KTXzfICwwCJTZx8UdFlnnYqeKEzu/Otet8lUDPFeAUqoO2XbTmN/sejxZ2RFn1vmbd3fq+AZ03QJC4g1YKOW847CP6H/2T8F0yP/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335427; c=relaxed/simple;
	bh=vVmVb1+AUxL5Y9lRHHansrW3SKT6z9kcOrk8hVIzAKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhY0WRibLtFnrtmxkgv2+KezFKH3rU1YEjWjmXd1N72MesnX3gYuqo4/t+lzX1P/NLUu4pl+A4bFem5psBdtdYkp8TlQReIOf+sC3KLToVnv7Vt94bCpVUxRMXB1NdV1hMBZzLj/CcelGvZUhAjvzPCw8Ba3at0ZKUxTS89IdYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+e9m8Ev; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+e9m8Ev"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso4473635e9.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335423; x=1792940223; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FiYpWoMosCoSccU6a8e7KPGSXisIBlLLyJMLkfFkPBY=;
        b=S+e9m8Evyep843TpyJOkXdAt8CY4zKOjCCg6KM/ftmTpME3i7MCBxCIJlVWQCjj7Ng
         pQrOzYcfIAc9WrWGkA5yLH9IFXMYIhR6bQT1gqZ+LiWfsTBmAdJT7mH/ced/2ieIlGwa
         Ri5OWs7uObuoiB3tOEGIr8Hvhhi/m3SdFfjeNAILTe+bZEALii3+hk01vCqgYwo5vnvx
         FCbUh55gytjJVjx2MTKi0XlPLHr4AwuzUs/sDB65T1psKr5K4n0gy7DPhwUQop/qqKRB
         dau+HMH6c6zn+6kWpDGZ8dOnE5QZEVN5+hZSCUCCLsCHEocKtntg0+3FcyVtakpqNgdo
         oDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335423; x=1792940223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FiYpWoMosCoSccU6a8e7KPGSXisIBlLLyJMLkfFkPBY=;
        b=SMjnPOyGkzFOBaN0Q4JFi+zhx8E6RoIUjybZYXvnfJ3Rt0Gg56IxINyGRUbx4PXziX
         DH69w6KEcLfM2NW0nk1b3ND+LQw1DiDjF9vkwxg9neVfHjRaFijUmc2rR2gPsJ35VqAu
         SRIhEH8nb+/74vfDZBkThU4h63oW7mtlQ52Z0R4gJrZuPsqR74myQOUMMTL9ie0Yvqdl
         8HHPIV9u6Weq4WU2R1Bmv1FaX/rncrMMV3TLioXsMlX5u0rE/V5P1+OzIMvUfEQDmWT0
         fNNeevbWnNbK56xcV/7i+p6WQSz6sNuxl3NesIRLyRVIkIt98st7slfSllINJnOwIjOB
         21Ig==
X-Gm-Message-State: AFq9FYIEKoqdtsEgbZw8kNAb3PD5ofXRLYATVktwOAeJX62Bce8o1rbC
	APnvVK8cwAuFC1sEko8iq/dY4AUZqUSG4427RP/ounLhpr7d4/M5ATY1L4pwV8IM
X-Gm-Gg: AYBFou04DkNoB0T5INl28PEn6+Lm6wfkS+hQVQQhEvCWjWVMoOmTjZuLXg85v1No0HN
	LsRL0KLnr2bzPGLQRjl0FrgmQiR56xpK7vOpKHltDMCtYdPI5dG5ZSpBIcT7hJgYnN5dORdnBtI
	RH2SgAL5xKWvBm/I6YIRcLKufzzZY4NTD062IvGVDpUBJnNBc5h4bPYrobOaxSe7dSEq2pz/oJx
	bNtXCcxgFj2HX4AGQVXQpbvrrRnRS7jvwYYemxRHHV8dOd+rIc9Aq3e9nLDgt0navmrubeeHiI3
	xbPr1sB4NlLZ/g22Ou3mjRVz0diEyEZcAUnd9KVLjkRRenKXfWGnOqu5TJJUWJH5Yy+Dje5kEvh
	RbOFn7J9pbVPNTTyrtH27PuhAIi7T8PPWq86QQW2azitB3Vf1oeTheI6qqxPLakTha++V1/SF3E
	R1OCTMkeYfdpOT2MgBn7OmrFKg+8C0/N39r1NtsRioBjoprG9PRE2F/TmICHah/RURY1rn8trop
	k1a1h/snMdUNg5/WaZa9I4=
X-Received: by 2002:a05:600c:3546:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4a1d75f8b58mr119057185e9.15.1792335422838;
        Sun, 18 Oct 2026 07:57:02 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce325107sm170403445e9.3.2026.10.18.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:57:02 -0700 (PDT)
Date: Sun, 18 Oct 2026 16:57:01 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 01/24] man/man7/unix.7: ERRORS: EINVAL: The address field
 is sun_family, not sun_type
Message-ID: <20261018.a9623e61b80a@gnoack.org>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-2-gnoack3000@gmail.com>
 <atSgok2UDdYB3f2P@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atSgok2UDdYB3f2P@debian>

Hello Alejandro!

On Sun, Oct 18, 2026 at 12:46:17PM +0200, Alejandro Colomar wrote:
> > Date: 2026-10-16 19:31:16+0200
> > From: Günther Noack <gnoack3000@gmail.com>
> >
> > struct sockaddr_un has no sun_type field; the address family is in
> > sun_family, as described in "Address format" above.  The check is done
> > by unix_validate_addr() in linux.git net/unix/af_unix.c.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> 
> I'd like to understand the reason why the bogus documentation existed at
> all.  For that, a 'Fixes:' tag would be necessary.  It'd also be
> interesting to know whether .sun_type was a human hallucination, or it
> existed at some point.
> 
> In this specific case, it seems to be:
> 
> 	Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")

Thanks, added the "Fixes:" tag.


> > Notes:
> >     Fixes an obvious typo
> 
> Most likely; still worth having a Fixes:.  Since I don't see any
> occurences of sun_type in glibc's or Linux's source code, let's assume
> it is a typo.

I also don't think sun_type ever existed.  I've read a bunch of old
documentation on BSD sockets, some of it dating back to the 90s, as
part of wrapping my head around Landlock's networking features, and
I've only come across a "family" field.

The best references to this are sockaddr(3type) and
sockaddr_un(3type).  The first and only common field of each of these
structs is the "family" field, which always has a different prefix
depending on the socket's address family (sun_family, sin_family,
etc.).  struct sockaddr_un only has a sun_family and sun_path field.

Another indicator that "family" is right is that it also talks about
AF_UNIX as the proper value for the field.  This is the value that
sun_family needs to have for it to be recognized as an AF_UNIX
address.  The AF stands for "address family".

–Günther
