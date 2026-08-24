Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1804493632
	for <linux-man@vger.kernel.org>; Mon, 24 Aug 2026 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787536870; cv=none; b=RZrY63b0OxbXa0a1IS9hHuJmEQqIHAKoZ/RDsXXCa+Hj60qzEn9XVDyFaf8fYx9Ql45O2UpnIX4tKsnV9dLxS2hJNBFJK3Fr+5wIA2qNoR1AJOj+6EFSRJHUiyBBEZkn1ggDQLJZ/XMfdwpMBjDiQnC2Ge7KP39Xbaz5AyqhZ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787536870; c=relaxed/simple;
	bh=TMpj44r0pxFo4oYlYMw+H3+aQXk53FrPXmqBuMsT8m8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KAf2iZaedoi5MOfpZrilhiMKHbJan0fHPhLLV97H44qYmlyYHt4V4ZBxGAAf73AINZ47ojgLKejpTiS1czKsJO7T3ZOGEsyftdRPKbqe+zi1RUFH0ROxdcuSaZlT0ah0HAq2xVrS4iic0F+DOXIOgbPDHz4JWzdEmn66Ze+fSMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLT7yOt7; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLT7yOt7"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2094515a91.0
        for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 19:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787536868; x=1788141668; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K2OAvcRWRJ9AOzIX9Xzf5uHwIGU6MnD+LNit0IGKlEM=;
        b=dLT7yOt7ohw/NKcQhhp1Ao09WZsuhvcs4l30KvKOLA27GpBc6wqANxQ2bRRijHHIa4
         118VpnqgIkoHBOGHwVRzc8yjyJP3Di70LwaRIZcWUVlR8AFQh5Lx/XtcMzmhglbFw8oc
         H37W3fiR9V5rL/4grxzzYyhPdSFpi8yv7olbr5XnTk/I6kn0pkn+3YNEaU248rxA4WJ6
         zBFyr1XspkpTyF0MD4/qAGZURSdvmwWR0YgCvHjUnhFIAihm7vs+24TOVu/8X7jaRfzW
         //n9cHPA3q6EAaKYl7EtJvQSIw7s1Wd3H2EiS/kxxo8Z3Bq/NJKDqy3CKhyx96omFFoc
         C6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787536868; x=1788141668;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K2OAvcRWRJ9AOzIX9Xzf5uHwIGU6MnD+LNit0IGKlEM=;
        b=QcilFweRWJ/MWHvLJqH3NYJFYrhCX8/7sknZiq6MUalQW8swMEbPUfvBb9EkKUd+S5
         StxVVlvg30eU78dd2vAeZVUuqRjmaipv+C3NyaziQMrRfvq39Pf5pRcymr9O9mQQMu20
         Uirk80lTWKHhfrmvHVRm4S56alUG6KjI+XESelzh/pG5IWgJZaFBqZ28yeeGtPWUZgDh
         VnZ25DFv03XynBx7RDp2iS15cMpdWnKEhkNNzdCYqx8ou/xsd6kWBIbAWhcGJKE6+sVo
         RBZHo5/ovWRzhQ/VfKJvfuN7Skhcoe7UN5uIgtNhB01Rf/OgZ6S5ThC8XdGPjwuiz7ys
         OaAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqhcv56bfZAzYZ5NS55wn/vXpjjW1WCkLoxMh4U42o20T237qERHEe6y/Apeb3npu+0Fwg3eYWeTsI=@vger.kernel.org
X-Gm-Message-State: AFuF++lhC7ZVDOeG9atuja04O+NHRGIjHyHLyE2haFWJcVv0Wl9389No
	fbLzCzJON0HEf4AxIwdomUfGzqmhLRG8r+ai6GQ+eDY2Q/eKZ7W41LSS
X-Gm-Gg: AR+sD10K/mOG7Z376/qFidKpgrQvv+QDpJtIwTfg4qHE4+ISiIFr3m2r08+t6l5Vnie
	zmtsTztimSUyOoAX1qi6SaeHWG3lA1RfpYt/RG3lSwMjPuJhazUtWuzOLMEWBnbA20K8bjeyL/x
	py/0bgCnnj5I6aFhJsRRGjyJnh1vfgxSy1V7OsIZIyn+p49vlW5V72lDh5NNOskPfYquqK9YnmU
	UHyuez9visdIC80OrNVsUagMCdx7t/gGjfPym2ydMeidLpPwWk6DJr9eFCI2+H3PoZGNZVQ4Dy6
	sQpmmYjGbVI8lW4GewmBrbLa3wFYHkTrkhJCTNWV8zrhsEm6Lw86H4R8plrIaB80uSOsIR8oOZS
	iTi/a+A73/lQxnjs3MZ2eXeNQc5qlFGFnQvWUDtU2UHT2sJyuVmXlUVGlzAYjc9MgL88cUmHNtz
	0dqyR+Q0KHhH3JHapwCdQYtdQszQ5wiOlY4zZigV14gn4sM/0RhZbp
X-Received: by 2002:a17:90b:38c8:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-395a04b80eamr33113400a91.5.1787536867915;
        Sun, 23 Aug 2026 19:01:07 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::53c7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14186173199sm19165105c88.9.2026.08.23.19.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 19:01:07 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>,  linux-man@vger.kernel.org,
  groff@gnu.org
Subject: Re: Using LS/LE
In-Reply-To: <20260824011129.njsipdzmay4smp6i@illithid>
References: <20260807021256.pwzsls7awqmbslti@illithid>
	<aorlBv8YTu4JlZcy@devuan> <20260823132749.pgypzsqv32n67wor@illithid>
	<aor4LIdGrSGHe3TB@devuan> <20260823141622.7vszwghxrxvkff4j@illithid>
	<aosHFaauEzKEFNpl@devuan> <20260823164451.5jeolmdu44ubpeba@illithid>
	<aotFzewQhmLJSk6N@devuan> <20260823204051.mkcgwghlljq7fqic@illithid>
	<aott22sJfNucOefn@devuan> <20260824011129.njsipdzmay4smp6i@illithid>
Date: Sun, 23 Aug 2026 19:01:06 -0700
Message-ID: <87h5kk1dlp.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"G. Branden Robinson" <g.branden.robinson@gmail.com> writes:

>> Interesting.  The day someone complains again about my makefiles, I'll
>> point to this data.  I checked a few other projects out of curiosity:
>> 
>> 	alx@devuan:~/src/shadow/shadow/master$ find | grep '\.am$' | grep -v gnulib | sort | xargs wc -c | tail -n1
>> 	31885 total
>> 	alx@devuan:~/src/gnu/glibc/master$ find | grep '\.am$' | grep -v gnulib | sort | xargs wc -c | tail -n1
>> 	0
>> 	alx@devuan:~/src/gnu/gcc/master$ find | grep '\.am$' | grep -v gnulib | sort | xargs wc -c | tail -n1
>> 	1527474 total
>> 	alx@devuan:~/src/gnu/coreutils/master$ find | grep '\.am$' | grep -v gnulib | sort | xargs wc -c | tail -n1
>> 	8171 ./Makefile.am
>> 	alx@devuan:~/src/gnu/findutils/master$ find | grep '\.am$' | grep -v gnulib | sort | xargs wc -c | tail -n1
>> 	35765 total
>> 
>> Does glibc not use automake?  What do they use?
>
> Hand-written Makefiles, apparently! For a while I followed their Git
> commits, but I'm well behind on them.  glibc and GCC saturated my
> ability to keep up with the projects I track.

Yes, glibc uses GNU make extensively. It is quite difficult to read if
you do not understand GNU make extensions, compared to Automake which is
for the most part just declaring targets and sources. It also requires
more upkeep to make sure things work correctly, e.g., parallelism.

So, I don't think pointing out that Automake files have a similar file
size to regular Makefiles is a good comparison.

Collin
