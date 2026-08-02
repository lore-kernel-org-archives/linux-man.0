Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F8312837
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713245; cv=none; b=c+A9vWbZPabDdxJO2GIA9ste0KHufEqW0tud4CtKGi7Wi7r9Hw/L8s+czSTJlyoC9Zs/IT2RVMeEnQ55k29TlxCwVRe1O3KFKglp6wovOtFPja+J/fXsyRH7l5QgbziiTGaMw3RBOkrA9CXGLtW8K5hurXjBwcg4VNFdxYk6p7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713245; c=relaxed/simple;
	bh=tUjmgXmcRrR2kD/gLn50a1A9CKGsqAGcNtvQJNH20/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DLirk6OF1oJsT/+Erk5bo/kr/zAOtc0RtPpxC9xP82L7wuQ6arfaxBlgahKzRQyUismsBAVIfOI4mMe3hTRNrVakApYmnBM7Mq0gMe3qHMD1AxfFKGQ/l0MK/MOk0FUVRQMy6O9jHrzVGxEjRQgr88NkOwRpaeKx9UfEnfcPrEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwpCYXK4; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwpCYXK4"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1515164a12.2
        for <linux-man@vger.kernel.org>; Sun, 02 Aug 2026 16:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785713244; x=1786318044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zB/Z3ZwI6BmeiZzmyDa36EeLDpJ++b9s3sWTHgCccnA=;
        b=UwpCYXK4WNipul98TD66f5MjMWpkLyhnFEZ4z48HlAbXrCpNtZkBQ0LpPc20x3MbPN
         KdN+BEPwuveDADtPswNM7c2z5Q4V/vXV9oFLdVqgvJuOAHWQ2YrzP6tKggq/njSG/o48
         CB1+afaQeNye1oCE+LyDHDSXRTncAqzh5kYSPHU/lr8pYtO198IaocKueVE/4Fz4wllz
         OdhnKjsLumWO3UA6Cdg96/Awub9mVVlUA/dDvjhi/awLy2gIjDDlxN6Hcr4OUjQ2YXUQ
         m06RgSFoyC8L20m7O3CZ0Gdb3+Z2cDXqUBKK/5embhWpN5CPHMSF95i84I6vlTowSyoZ
         j+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785713244; x=1786318044;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zB/Z3ZwI6BmeiZzmyDa36EeLDpJ++b9s3sWTHgCccnA=;
        b=LyGbRdTVMKyB21d2ed5Lz13AO+Hwopj99YW8hgwJZRz3jXfNLE4JwhWkPnEju1vs5r
         xgNSFVSFGmt4cocSXs535pKyzz4VgwJwKSSYCnwrCAAZcjEF+ERLB4ZF3UUGrRMCIXYP
         JslrbLSNJjGzr4Ufsp9uNcYCZAQtGcRQE/QnBLuUBABLX8EpuuSrdBiO2bQn/4QcTGrL
         z40CFZuZgf2TXqUINAol8/4CTt3F22NCBhVV+wp61tgVDJcecjmc4JD74alvfgn5pWaT
         /CFJVPhdOofJqhP1NyRpAuct0uWwflXoLA2Xs5wSpTKtR0QV0HJtRMC6ApUJn0DtwmcN
         o60Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq7Df7destJ0Ym4o/uPnol0xaorCKH7+sdF9hUnZuAroA41bLW6bXKjFQPh36mQO/b+CdaDguw1pvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN/hpSR1syy46YfqibfWnlZwvzU4JXgWTG4Mxck6EZ+w7vxndD
	kblodQl5oW7IiSjFdZtpTLHfZ7Y6Mo1DXfNDlH1a5H0BOnA6In1yTwml
X-Gm-Gg: AR+sD12TouUvgzW3LEICHJPrgdUa5hql4OQO1D1CHw1ncLNlBVyQM1Wlomp/OhUes6v
	u05+D4kg0w6MjGpMV0UqCnloXiAftoCbz7sVElpKz5uJ+LXuwa3tqAPeuFu4WJZ4rgiembSzRQV
	4nETN9nddFNe39cI2BL2I0/75ZOT2lPdItUViQ+wnJ8CgbC9GW5SYAYr1GyOP7DU73rnKzd9cPW
	B4oL8+MI2WDS0B5oonoWUCPlyA+T2iqqN2vsRGFiz3WYh/jPX75e5TFQzVvzTgJB9prrHw9jvfR
	qO2EtfDZrH9LrQzzJsyFTEl4ypoYexmtpjoKTc2YlC5nrvKbvBtJa0Hda9sfjfrak/v9/CW5Obu
	cKduCxW4bEAL6oCRu7db2QJ6T2XILVhJLArZD/qKeNWr7QkPSRqZZ9tHuZG/MYZZDtPHxxtPq/R
	o1JPAZ0CUzxCJRqaY+CJcZx4hTHvxRHyly7X7GKxbuX4t0rBT9rN0=
X-Received: by 2002:a05:6a20:e292:b0:3c3:2e2b:29ee with SMTP id adf61e73a8af0-3c92a89be42mr7619575637.55.1785713243544;
        Sun, 02 Aug 2026 16:27:23 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::4bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb50dsm40471717c88.10.2026.08.02.16.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 16:27:23 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,  Alejandro Colomar
 <alx@kernel.org>,
  "Maciej W. Rozycki" <macro@orcam.me.uk>,  Paul Eggert
 <eggert@cs.ucla.edu>,  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <20260802231058.o7gud4bd7co2nbhv@illithid>
References: <am56ZBzNM5J07AUa@devuan>
	<f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
	<am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid>
	<am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com>
	<am6X32HkGdm2xTd7@devuan>
	<alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
	<am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
	<20260802231058.o7gud4bd7co2nbhv@illithid>
Date: Sun, 02 Aug 2026 16:27:21 -0700
Message-ID: <875x1sp0h2.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"G. Branden Robinson" <g.branden.robinson@gmail.com> writes:

> At 2026-08-03T01:08:32+0200, Arsen Arsenovi=C4=87 wrote:
>> Alejandro Colomar <alx@kernel.org> writes:
>> > Most programmers can live in the safe bubble of <string.h>: those
>> > functions always require a string as input, and always provide a
>> > string as output.  Plain and simple.  It's difficult to write bugs
>> > when using those.
>> >
>> > That's the rationale.
>>=20
>> I do not follow.
>>=20
>> C has no namespaces, let alone qualified imports.
>
> That's true.
>
>> The name of a header providing some function is thus inconsequential.
>
> Then why not have one official big header file for the whole standard?
>
> #include <stdlibc.h>
>
> When you answer that to your own satisfaction, I suspect you'll have
> little trouble following Alex's argument.
>
> ...which doesn't mean you'll agree with it.

Plan 9 did this but with "#include <libc.h>" and it seems to have worked
fine.

I can't help but wonder of what happens in WG 14 rejects this
controversial, as obvious by this thread, change. Will the man-pages
changes be reverted? Or will we slowly watch them document personal
preferences instead of existing standards? After seeing weekly threads
about the prototype changes, I don't think it is an unreasonable
concern.

Collin
