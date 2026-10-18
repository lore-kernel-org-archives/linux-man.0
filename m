Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A35495526
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 12:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327085; cv=none; b=sFDTIPG4/VmnFYRmMMKfrCICM/VgweXV1b0Qgxipt2e+Y88ijMQ3856nCTDZRKfEsX61TKTEqRTanSHc9FFFYTU0mJwseHEUAXsgV0sbr6xeMOPbZD6vORLACu/Oa5qBWPHXo+0hfiG5eaK/NAsW7L8zXNuwQfiLsj7MRacIPcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327085; c=relaxed/simple;
	bh=XKs9Y5y4wKjvFviXXX2Z+5cBrf/f3P82aOy5ELI67ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZCI6Nz+0yStlhRI/jbn8w/PxtfrVhItgXL7D+EQS7o4Y9TItLNzUIU7PDkYmWU769pcR92IQZ3J/93VJTq7LWoUglYAxoQuo7rmD6TAUEnEqmEPSRDdvhJmJQVFdYtMQcd6SMxaGe9FVWCMWjeSxOdLv0rknBdaGpI2B2VtAxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYhd6t8m; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYhd6t8m"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so2680145e9.1
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327078; x=1792931878; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFX0pLH3vOnur12kPQIaqVbBIfiaptD9oJ6HPoc2SWQ=;
        b=OYhd6t8mVxlz+L/S0wUFHiTHf+wPOAkMBY28p1c8iadqosXWXvm6GiiL6IBWlXAd0j
         BJMmRCOuWmGnRy3TwYJLt9NjhnJ9unVbP7jo49vnB590Emr6JODQxjkQD1/xxh5aDd0w
         1oM+agJSlVpthtGvy+4MvYd4PmKw6a1kN2NHO9XEUq2HDtNoMgNEKqVWDfohD+0TpDDi
         AHtFpHmhWUUnSbMSSNdnyWxAL15wBeTEGh3Vdh6/vPvL5d4n+hUxve6mzCBic/KaOOnk
         dXw2FLGxb3tYPdQsahKbNkfl4xEoKK+zZhFd9EiOOMyjfv3F9GCG98GC3Fcqcx4Jeakp
         lRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327078; x=1792931878;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TFX0pLH3vOnur12kPQIaqVbBIfiaptD9oJ6HPoc2SWQ=;
        b=ZIndjWX3W/10lPyI+SXuIverMXuQfypiMYF6zHEDUmhNhVa4992RUPSl1nUrB+y9p/
         112kUGtvtc88oqRDSXvmrZPuT0HN4tDDaZK5tWd8iz8TbntLoO6jHhfPpf0TrwLOby6a
         NWLyw1DtkSYXfaS4ABw7fhL3HSufM7WGvvEgtuA6e2Qw/ZwNvKTqiv1gn2Drm4XEaSiE
         5k7nZbbZj8QOPB55lgWaKj8ncj/v4kOcR+4Qgj+NEE/pAeB6NTiwdTMeSjR3Vt4HLB4s
         oa3+t1tdJH36UfClWif+GedMqvFt1X9irAXVesAkT6EFH45VR9HboavZ8rjTCrC1k1Vs
         UP6g==
X-Gm-Message-State: AFq9FYIWJUJPSJKf4D7YWZQPBl1AtRd5VgidrEXZ55Pt2X0uIcN6BeHZ
	Lr2tCxe6GcjBPr8fJAtnoeytQn4WzkjHfHFAp/yL7cvodIeATeB3P/PGdeDcuoj6
X-Gm-Gg: AYBFou17kQNxhhRefkeC4Ek0EPP8L/TkajMgrcaZofl3USf4IhSVoBL03QYsIsUvYdt
	/mJFes/yQjg/0gmgKuntQ7peNT5Rmj53nVUWW9BUJt6aIZvYxbaOKwSIXxPF/I34+MwUvn91s4d
	sOc4MhRnn3Zfv7DTou2Py/+b2Ld6lVFDsPLcslF6rbAiIISI/tFSet/QSpNm7e8m5XUzb+lLZ10
	vGCMqp4kCdNVZn2nJkpius+34vX4RooA7vBAKMeSvaezX/CYtTzrD2wNt9WS6e6cPMgNVhiArgJ
	OGfD29gv35U9ZYRmCU9iQZ/eEPgSb750CWLrRaWyTGFYxp7ot7GsVbF2NKBiKvR+gBfUHOw3djf
	IJsPxPqY8Eof8S/O4wsEhV5kT6Bgxv1gcAy6h8WTEY/bG+JtIe6aSi0/uZcOiqXudhIwVgR7kwt
	c3xSy7K7O1qey9ZxrIlH04OSc/BAA/7JI6eLXLJmVDS3USa77AIWq4znQetHeKVpBmVslov7e19
	BHbqDwB0RgqOZo+7R0dT1APka2uy4OXeA==
X-Received: by 2002:a05:600c:c16a:b0:4a1:acab:234c with SMTP id 5b1f17b1804b1-4a1d75f23a1mr100251535e9.10.1792327077641;
        Sun, 18 Oct 2026 05:37:57 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d28b698asm193294385e9.11.2026.10.18.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:37:55 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:37:49 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 06/24] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol
 0 is also accepted
Message-ID: <20261018.221f6e5361f0@gnoack.org>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-7-gnoack3000@gmail.com>
 <atSqLSOUOfSB8lFn@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atSqLSOUOfSB8lFn@debian>

On Sun, Oct 18, 2026 at 01:19:34PM +0200, Alejandro Colomar wrote:
> Hi,
> 
> > Date: 2026-10-16 19:31:21+0200
> > From: Günther Noack <gnoack3000@gmail.com>
> >
> > unix_create() in linux.git net/unix/af_unix.c only fails if
> > 'protocol && protocol != PF_UNIX'.  0 is the usual value, and the one
> > used in the SYNOPSIS.
> 
> The commit message seems bogus.  What does that 'only' intend to mean?
> The actual diff seems better than the commit message, but I'm not taking
> it.  This is an example of the nonsense produced by LLMs.  I'm NAKing
> the remainders of the patch set; that is, for patches 06..24/24:
> 
> 	Nacked-by: Alejandro Colomar <alx@kernel.org>
> 
> The exception for LLM use is explicitly terminated.

The commit message may be short, but it is factually correct: The
referenced unix_create() function starts with this guard at the
beginning:

  if (protocol && protocol != PF_UNIX)
  	return -EPROTONOSUPPORT;

It rejects the creation with EPROTONOSUPPORT (only) if the condition
"protocol && protocol != PF_UNIX) is met.  That is, protocol must be
either 0, or it must be PF_UNIX (a.k.a. AF_UNIX) to pass the check.

The "protocol" value corresponds to the protocol value passed to
socket(2), which is left at 0 in most common protocols, such as when
invoked with socket(AF_UNIX, SOCK_STREAM, 0) or socket(AF_INET,
SOCK_{STREAM,DGRAM}, 0).

I can send you an updated version if you prefer more context in the
commit message.


> The patches I've already reviewed seem okay, although please have
> another look at them, especially at their commit messages, in case I
> missed anything.  Please resend the patches that I've reviewed,
> including my review tags and any other tags, and I'll apply them.

Fair, I'll update and resend the patchset with more information.

I would like to point out two things though:

1. I have done a pretty tedious and manual review to verify and often
   reword each single patch.  It's possible that a commit message with
   a lower level of detail slipped through, but this is all fixable.

2. The fixes are largely independent of each other, and if you think
   that patches within 1-5 are good, then you'll very likely find the
   same for patches after that as well.

I'd encourage you to rethink your decision; I do think that these
patches improve the documentation.

–Günther
