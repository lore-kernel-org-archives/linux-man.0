Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091299;
	b=a55tgkgKCiYffqgPYQ+BfcZQ6uYDGxwCIgFHRVLj64ES7LSGUL8yhSHHgQclGrqMIl6Y
	 ZLj1QhU2tFBvCR3847T+mjFYleRI+7fHEZNiMcgIjhqwGPYjHtscWAgWDdBRB5S8Je03j
	 qxMyMhhV+zXjBpgosLXpFun2BUgWylEp8ca73YjtS6qXtGlRPsO5xl7SLBrwkJwtm92NV
	 a7rFgOqMtjc+uJgyWAwK8Ewskl38IHyIR74U6lXNYTxbaW/nH6mlmca/rUh0g9I2lF51q
	 0pzcV0YH6fdbcqF5/Ff8wkaR6i5yGTis4vAF7RjlyupbaiW7EAxqPjFFIgth/lpvQag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ZHANNKgySv3GzsgzEAr0TzxosMKl+vyJqqTuGeOv52Y=;
	b=diAS6eS1Ih/emk6NCA4i+kiq6GidKcxIx/Qnevbst8tDd95X5PUcK0O8kRD2EZlQVTEa
	 Z+Tk5+zGDgAdj+/d7pJB8dqncRcxXNaUKx80MY6Zhth5+XZXJJ3fDF0G+3E1uujL26aqg
	 qT8muBfpiVFV1TSOEwvb3O62dTNyMbf8GQPIeL95Rvzo3KxQfTQCkAvGXapludmb8lwWt
	 sCETT8KnrMbQJIqBAF9LlsKxRQm2NmdEyk/Yl43KX1r171cFqZfqxKsfp3QF/QdShKvBW
	 3+ygVUrJsezSCBTBVUWcj7DTgciL7c0YoozE88YLy91qG6hZV4AJNjX6uP+yJ952QsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dDiSqiFN;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26306606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 08:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26306606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dDiSqiFN
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2297469f8f.3
        for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091297; x=1793696097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZHANNKgySv3GzsgzEAr0TzxosMKl+vyJqqTuGeOv52Y=;
        b=dDiSqiFNe+oZvIEjCDedaC/ym9OQqY3LWNobGCV7mAabSp80VNvlMQk9WOnoLaZh56
         +3ofMiY8vbblMSTnTPn2fFLY0M2uNbniUmdqNDMEgmij4wXXy6cY3gQpvU88iVRcYd4m
         53poIc5kcuoRvWKf+I9ktEZtyLcm6hkSH2lfYlksnPfgRFGjcfRAyAypVUvvnJPEYsBy
         qc6W84FGdQV0vMhZA5WyaQaGjRyPAiruUsAWeDUbJlxYHNNXCeq/MIQybY7Z9SayZOAU
         xzLaZ01N9faHmvhKeCrAA6Q/SfylatB8vjBe3uXFxN5v3Khma/J8aWA/QjTitX5DhOsX
         awaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091297; x=1793696097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZHANNKgySv3GzsgzEAr0TzxosMKl+vyJqqTuGeOv52Y=;
        b=d6J3OefajjzVf5YlQrV9sc210Replq4a4kIcBDItDJx1EgAKCT910oNqQusOi1fruA
         WZ/2rXeCL3RwcMu+UrjTRYnein5SqephtvhhwPgdSAh973fu8KyEHksukQtlYy5pZJxo
         3fN4Jd/7VFVb5q5CxwPk43LeuC6eYw9MCV6rStgGlKzbzJcou/+iCSRLjFwzdW3Je+qw
         qqpPO8vVGx2H62C0+YY9ejEk1ma9aA/bft2ys/0X0CMU8cueRUud9gnOHUXCSIl10s5n
         coWAAARow59jfXcj5idzX2jI29ik2Yfb9EpbEuQBJ/Xndx2gIhVXkVDEg4dO7EvTalfq
         1LnA==
X-Gm-Message-State: AFq9FYKxW4iR320Y4/DTEz5hIyCltzpMGwQtxh9bb+L2d6TUJZDDchFA
	gVwx6QbLGfk/huY6aBOjFFdp+yLgfm1CTKYeC1+IuqGnoWQ0JGhOQg5H
X-Gm-Gg: AYBFou1qPkbmVOevBl8UB+dELU5XAx+X5dNOmC2Ui3ISLKMuo2bI4+Z1wItTeA1ixk/
	bgap1yXA21aPEOT/RH8Ei9WRQb+ogbRvV/3avq4myIRwEm7Rf3jAl8LtUIB4QMs2yr27x3xtUNY
	xf3XKNNHcl8m0IHxESgO6tDeie6Tk2Fb1qKxguhf9BBWQhYMPZiIvppEEiP5qBsMkLrL8RNfYQZ
	0lPX4M0Dbyn/4B+V31z01Q0OzsA2OcMpOthZURQVaScBi9c+0dkDsbNJK6uJ39XhrdYJ4ohsN9p
	2BcLLUyxHShalcxneDF7fhpRTEYqXW2SNAbGpgY8LrYnPOt4flIOII6ZSusglrqkvfMhgMQfTtA
	avicbSYTLUQpOyQM3iTDq+s3rtshg03jy1eiK1kUSY6NNpcCHypKETUwPc+IgRlTwLHwourkMlv
	WSezN/slGqdz4wcSJobOqTtuXQGxCritIF7NCFR0EDt7nY4UP2o0yfykNYzH6eMQgA9ARcuCJ61
	S5e+/KEtfsf9for5ry1JPA+iqQaVfotc14xbGenf1pUb2fPL9+jE4qo/SEiABLW1MYI6YYPQUds
	23XS
X-Received: by 2002:a05:6000:4552:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e3eba1229mr10176517f8f.47.1793091297512;
        Tue, 27 Oct 2026 01:54:57 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm20714189f8f.43.2026.10.27.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:54:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:54:51 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <20261027.4df00f962b98@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
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
In-Reply-To: <20261026.f6d2e191a08e@gnoack.org>

On Mon, Oct 26, 2026 at 11:41:13PM +0100, Günther Noack wrote:
> I'm still leaning towards documenting it as a buffer with
> implementation-defined contents which are provided by a LSM.  How
> these buffer contents are interpreted is depending on the LSM in use
> anyway.

To make a more concrete and constructive wording proposal:


SCM_SECURITY

  Receive the security context (the security label) of the peer
  socket, as provided by the active Linux Security Module (LSM).  The
  received ancillary data is a byte buffer.

  The exact format of the security context buffer is defined by the
  active major LSM.  For example, SELinux returns a SELinux label as a
  string (including a terminating null byte).


Does that sound reasonable? Let me know what you think.

I removed the wording "There is no fixed limit ...", because it should
be a given that callers allocate enough buffer space for receiving and
check the truncation flag.  (The more important part is that we remove
the previous wording which suggested that it would fit into NAME_MAX.)

Given that SCM_SECURITY on "real" networks seems to have the same
"buffer, not string" semantics, it feels fair to express it that way?
People who want to read the security context will anyway need to read
up on the exact format used by the LSM in order to attribute any
meaning to it.

–Günther

P.S.: I had a hard time finding many usage examples.  The main user of
SCM_SECURITY seems to be systemd's journald, which uses it to log the
SELinux security label.  That code can deal with both null terminated
strings and ones where it is missing (due to truncation), and there is
a comment indicating that they are aware of possible truncation.
