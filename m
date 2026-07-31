Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D50D331ECF
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 23:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785541722; cv=none; b=myiCP9lQGfatP7YWlvT95/GJmqD0qWNuTbJ9LdfiWXTvQPtIPFtDb+rdXl8oyWK8XRxkH2U0qhJgC7J0smKu32o//5zaoO9rosCTRGI9cdaRgogTzTDUfX9Li2sPcasX9XpO/xJ5DeFMp9Hh/VGQZJ2WlLzJa6u0MSHHqCcwuKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785541722; c=relaxed/simple;
	bh=gt/5av8JTOO8HKCAgk6wjFEA0Zfh+75yyg9tcDZ15f0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C+VfWwwoVd3cUJgLkQ9RIewyZAelAasEvXOGY3z3xhrggELTq6akvbmsttDDT2Z7wM5tzHVyXS7BjHlWLaN3BfZtwRNDGgDni7HwN/4ODoBbnF/9ndFp5wfF4rbcKzkR0VQmZDuCpSHgCzBPut9t1NDAhAsQubn6i3p2imLNsy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouUcotbi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouUcotbi"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so16210005ad.2
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 16:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785541720; x=1786146520; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gt/5av8JTOO8HKCAgk6wjFEA0Zfh+75yyg9tcDZ15f0=;
        b=ouUcotbiWSmcJAWoW5jahMPjdUqWcKzOQQVsGfvax50FqPI3zyqvr7nywvcRzzJm2H
         oiygLm7GkoQVhHr600neygGtLPpZ8zBHcQ6gjBE9oiutLtcs4f8WwJc+Lvcf4Y9GzTsV
         deDg5QcqwXXXB0jPl0/l3R/LFE4ufwUlRBb1e4qvsD3TR59+m4AUYS12TcKdWm9lIK0V
         sGgMSpurZZTcwwlqc+svZ1l1dq7YRkqhhz7QLi7iWGuFKETaF9I1u75Rjqz8DoOvhnC8
         xgw7r5x7U4LqsOCjlKkNPY1iwLXLX/Za2MLRj8gO699qBPLVWdB/gPBS0nQONUfO2tyd
         TbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785541720; x=1786146520;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gt/5av8JTOO8HKCAgk6wjFEA0Zfh+75yyg9tcDZ15f0=;
        b=ieMdXrs/cqVCtz0fZrxm8grHNSuyzFNu64AYrQgfiGJvty/pvz/bwUnSM5QaGULWrZ
         2H5HsdK8J9/7vVs1Wz29KR2wJOC9dRv8k/sIQNMg/0UoZpQw8pz024aAUgS1N7H1ue1K
         Wyj4PWmZwrwSESddXhPxfzh9Y0z19D6S73ofGUgBimwHb6WKDeO88ILbtO+5cSooz1a0
         8zix4ZdUabvKmYaAUOFUxbTxjvd7u5fUTipXvQaTksbcSJXEDT0MulEVfeeMxYTJ4vAv
         wwxnkRDj2x6xQgpQi6pDLBucKLHAhejCH6UIdio1DMFgSUlNBdAo/hwuScipaDUapCIA
         pMtw==
X-Forwarded-Encrypted: i=1; AHgh+RrLg7MzKsAwnMhyFPoCl2lm3N9Cef0uIVTOpv1e3svKuas3wDTaffoIhNmV3zVStLn8YpwenR8cKHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW9L4MyGc4nfk2euZdPBqq0QAnknjkf97c70bm1uvfTQO2OIdp
	iBPnUoFgADMXa08uuntjQwmDmf019kqIXtxhZJfh4cgX0s79IbvBPiOl
X-Gm-Gg: AR+sD11vw9q21NKwwM+FH6kYuCELIYRngL2wsZkJzFjwUihgJjH1DnUhvHmYaAev1tk
	oqdfUtdLgRZ0ByVP9YjoFxB8MpVlVC0lo6NBlKOBSQ6ULqvfyaqettVUkEZeq39MPj0+aL044PB
	ZYO0d4wktPpd/mgEeXFhQJVY8OiFW64Kh68NmbOPa9n2QwvsslBGi4ZNUq+ntCUqv5VCJxNv7Zh
	z3htsdFCFBVS80Nn55xfK9hL6lZadqfN7E1z7zpcvydXeJMsOrxIBRX1MkEUFw4NkpvoR25S7Fw
	MJx/D+AUa73JVWdCDC1UMSk5fQ4+h526kApgcf+zzh96KA3fiNbEhF1rVRAiVoxorfK6XugtG+a
	YEAW6UdgF1I6AutwG2n35BOJi9fzMHch2MXNCpzs8k/HR8mtz4H3X+dAqKf3BzB/4mTYV5/FpQe
	yTAG2K0f6yYE+sEGcDZVM37V1pJCBe9S0hW2Acw2ZFLDEyt0mPqkL0HRGShbtpY0S4AJSQC3vwc
	9FUuEjNklbIYqGlKbJdpLLxRgL2TKk=
X-Received: by 2002:a17:902:e888:b0:2ca:d818:61e5 with SMTP id d9443c01a7336-2d0523e147amr16179655ad.26.1785541720439;
        Fri, 31 Jul 2026 16:48:40 -0700 (PDT)
Received: from XTHCYRY1WD-Collin-Funk ([2601:646:8081:3770:2c07:a238:af16:903d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fc98sm10064506eec.21.2026.07.31.16.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 16:48:39 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Joseph Myers <josmyers@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>,  linux-man@vger.kernel.org,  Keith
 Bostic <keith@bostic.com>,  Mark Harris <mark.hsj@gmail.com>,  Nevin Liber
 <nevin@cplusplusguy.com>,  JeanHeyd Meneide <phdofthehouse@gmail.com>,
  Christopher Bazley <chris.bazley.wg14@gmail.com>,  "Serge E. Hallyn"
 <serge@hallyn.com>,  Iker Pedrosa <ipedrosa@redhat.com>,  "Evgeny Grin
 (Karlson2k)" <k2k@drgrin.dev>,  Kees Cook <keescook@chromium.org>,
  bug-gnulib@gnu.org,  libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem, strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
In-Reply-To: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> (Joseph Myers's
	message of "Fri, 31 Jul 2026 21:23:35 +0000 (UTC)")
References: <cover.1785532392.git.alx@kernel.org>
	<784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
	<e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
Date: Fri, 31 Jul 2026 16:48:38 -0700
Message-ID: <m15x1u7max.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Joseph Myers <josmyers@redhat.com> writes:

> I'd rather we add a mandatory deprecation warning to memory.h in glibc.

I would be for this change, and am surprised it has not already been
done, to honest. The use of memory.h is a good indicator code hasn't
been touched since the 80s.

Collin
