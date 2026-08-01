Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7C723D7F4
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 23:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785626782; cv=none; b=Ur32QeL5ylgyjZdG6kiZVTWkQB7t2T70YBnIAVZL/8UhgbfdV/mkjKipqz1YnW3MVmmxzermGJfFr2Ts9JkkUvZ8FLgRWhuhxtIP2baUY782n70fNBR9xnHkZ5nnn4BA5yJAM7unupkjkP+qVAXJ3vDR+B+tKvu7b2/UaVUVYtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785626782; c=relaxed/simple;
	bh=J4sKvKTzSSpAr1XGMerhlm7lCpGmPEF6OpZrLhp/Los=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b76zSoaDDFE2XHYHxkSKX2ZqA22iH6/Pt5KplESE2ETv+hFMlBFCnimhfWbxwqhfIu6KeT62Z+/KDOYnHcdAfgoaBg+1Wvv3UJsKO2o80RHgab5haEiUU7Y5NfhHTsIshKrDF7YEAJHjwhUs8hZrdkQ+/bVkLsnMb5HwUYM76FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+ZceEfa; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+ZceEfa"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2017347a91.0
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 16:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785626781; x=1786231581; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XJSo3Yij9romaJ5o5OX5olLUP12kLEZRBz7wHhDRWao=;
        b=Q+ZceEfaslYVTh2v9Qp4ATYupzbRHCoxWDk+M/3a1Fn1sRjdw3GpndzSa15qgKNr9D
         0aEKvHQ/BM1dS0ulxZ8lwFYdN5ADURbfCFwy+2kohOUooETSgtsYfBt3mGgTiCBvldIa
         03Y62x3gK3f1xaNfF8jqI4duQI3uRPDH4EtCvgQtFRhH+Tt7HlqIanIPdLotTSgAisY3
         DoO6qu6y98LYpD3+61tT/5imJKGHJLsCQVmFRwlOBa+B29kVIgDwoWwEih61H/D7WMMe
         ik9jeaDXAoqZgTLJZPD1hE2qQ/JIalSBjmb4nIDzSvOnp3Dh7/EqlJclG3PNji9GJ+jQ
         0Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785626781; x=1786231581;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XJSo3Yij9romaJ5o5OX5olLUP12kLEZRBz7wHhDRWao=;
        b=di5nIsbcJrIoA4djPddDmqrkGWeei8mrMxIl7ojtRpTqqFY8lnd6DuVBweTcP88n9X
         iXEvviJX6RRk6b801TK+YZUVMHI+cGpfWtgYybAyag1oETSbbLLHR4vsd1XqwK708HHz
         K90m4va1y1OFgbQRSHmvxR6WbRmGommhCoM1lNev20RLuN6uxtIopWN6hK5m+UrspLhI
         jirMixAxn/JGO5ATwI1yPmynv1SaDOiI2TaEzztC4JW+V6Ev9W7mCeq63JEGK/H1i625
         /X0XM+Lv4OiWK3JlrX8NMS5/BnIVxIf5R9BJkZTsb0Iv3JH3+2Rl7MG5me1Afbc3yyMT
         j4lg==
X-Forwarded-Encrypted: i=1; AHgh+Rrcih7fgWrHeF5h1s5WexkXinbT60rbPInD1IbcYHAR/YDyb/x/IJPvL4l5J7mh1OO5md/EezV6bOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQiiU/08EXaQ3T0L5bz/CcwiVFSDevQl5LDhqrxAs5qw8nzDkc
	Qw8alcBH3AyCkAiWr9PrkgXqEXsDM673QcwjOrwmtIsA+7q1tciR7bzo
X-Gm-Gg: AR+sD100AI2ocTbreiCslgNBfTVWyLm8+Otj/8yDtOrTBe4tzgiRTiLLIpaJirUIiN7
	U8+dsEVoxtIlzhSXkx7GCuSqWnPb4NjcnKxB0hljWEYDij2494XQRHk4v62hBEX3hyPMb8DTEnc
	VLBmNpy0Asnr5vGwp36HgJgUT6BuhgFc82WGW090zu/ur6mYAF9Mcyvb3mqKY2pwp5g/gco8ACx
	gyGuNMpt8D5FPURfz2sPIWE+ALOLqu/jvuNSRWzr1fH01kB1w1OhP146cb6mB9QcPPzibzH06Et
	eMxGbGUQaGN9FSe+x+pqzFcdQavVCi7NQEPNpA3gVOQgXF7oYbzGT9yKzfmyYLQBcdh4Bp5krhc
	Zy3Y2i4FIwwZt39hCwL1welfwCAWGEII2igBzJHiShWcelTPM8GB/U99egRHY4bixt4PzqCEd7t
	HasB7UeasjPe/bX00l/3CUTaTGvemoRisUeOpL+aTQsg==
X-Received: by 2002:a05:6a20:a114:b0:3c0:9c19:65a3 with SMTP id adf61e73a8af0-3c92a98cd35mr4640039637.75.1785626780752;
        Sat, 01 Aug 2026 16:26:20 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::4bd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm29097881eec.16.2026.08.01.16.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 16:26:20 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Bruno Haible <bruno@clisp.org>,  linux-man@vger.kernel.org,  Sam James
 <sam@gentoo.org>,  "G. Branden Robinson" <g.branden.robinson@gmail.com>,
  Joseph Myers <josmyers@redhat.com>,  Keith Bostic <keith@bostic.com>,
  Mark Harris <mark.hsj@gmail.com>,  Nevin Liber <nevin@cplusplusguy.com>,
  JeanHeyd Meneide <phdofthehouse@gmail.com>,  Christopher Bazley
 <chris.bazley.wg14@gmail.com>,  Serge Hallyn <serge@hallyn.com>,  Iker
 Pedrosa <ipedrosa@redhat.com>,  Evgeny Grin <k2k@drgrin.dev>,  Kees Cook
 <keescook@chromium.org>,  bug-gnulib@gnu.org,  libc-alpha@sourceware.org
Subject: Re: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard
 mem*() functions as provided by <memory.h>
In-Reply-To: <am56ZBzNM5J07AUa@devuan>
References: <cover.1785532392.git.alx@kernel.org> <3556566.BddDVKsqQX@cagnes>
	<am50AM0bdufHa9W3@devuan> <15288158.RDIVbhacDa@cagnes>
	<am56ZBzNM5J07AUa@devuan>
Date: Sat, 01 Aug 2026 16:26:18 -0700
Message-ID: <87ik5ts9r9.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alejandro Colomar <alx@kernel.org> writes:

>> Still, for the next 10 years, C programmers would debate whether they should
>> #include <string.h> or #include <memory.h>. Different C programmers in the
>> same team will have different personal opinions. Thus, programmer team leads
>> will have to establish coding styles/guidelines which say which header to
>> include in this case.
>
> I find that an acceptable result.

But you aren't the only one who uses or references the man pages. From
this thread, many people are not happy with the change.

> #include's aren't that important. When reading code, the section of
> #include's is unimportant as long as it works.

In this case they won't "always work", hence your request that gnulib
and illumos make changes to accommodate your preferences.

>> I don't agree with you that it's "fair game". The SYNOPSIS is the first
>> eye-catcher, often the only part that a programmer reads. It would be a
>> disgrace if the man page, in the SYNOPSIS, mentions a different header than
>> the authoritative source.
>
> Some would question the fact that the glibc manual is the authoritative
> source for glibc documentation.  :)

I am not sure why it wouldn't be? It is what the glibc maintainers most
actively update. It isn't perfect of course, but it does contain quite a
lot of information:

    $ pdfinfo manual/libc.pdf  | grep '^Pages:'
    Pages:           1284

Collin
