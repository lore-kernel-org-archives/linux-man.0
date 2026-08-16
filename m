Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25B011CA9
	for <linux-man@vger.kernel.org>; Sun, 16 Aug 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786885410; cv=none; b=b4w6BvwUNQZipMZVMsuImCXux60ziSHcJtfzySXsC2h6iNh0wHjv6vb1PNBiRzdyj1GKl+LUQmtnkrJi0tkndBc+4mdl8kAD5xRzsCkTFbRb3GxzSnI+YarCQkbLjMIwQ+/5sUzwzXyyThioA7p+beGbqzTWy0iy2PkhemyRhO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786885410; c=relaxed/simple;
	bh=WQNmaZmljaHUlLSSbGabx0PhbzcEa0Z5bv7RTDncvcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c0P7t6ZOx0wrNGUWzk6z+sHhHRbvbvQSQRbvolE/LyJiRer56Dm8pCh+cz45tseYEdjY7CbX1nrP87H9EXGJNi/WiI/gs7Q0iXYbX8OzOysbK8Q6zNwMxnBFd4O6E+lL4zmH9T13hmUMy03DqOB2rIddBMva3gYwZPAi+hzhHQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d6tG7gE/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6tG7gE/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2453407a91.2
        for <linux-man@vger.kernel.org>; Sun, 16 Aug 2026 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786885408; x=1787490208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/lX86K+JZrDFDK9uTD1J74KGfHX5SO2ORotkiNNQPo=;
        b=d6tG7gE/uPtCltqO/kfuuqmF4l2f03eP0H8dyhRqPx8vL3b+Lw9a+6iBZPYuNzD7DT
         MVHAA60xgaY7wQ5L5PqS7toMmfe8o1bKqt+nQaZ7qeWS+m38/NFV5v/EyyPaAOKcutPv
         kkLLkUS4I3PYJt/J8QKM0r5CX/k7YUUU80VutMA/GZYGqPxsB55ENk89xKN1GMY9O4QL
         pm+q8cY4L+A3mPb7nTQFsV6cFqC7CfryxPynJTmytgshXDXx8Z5vHlOzZ6z27NJwvrLv
         T6YJMpmM/gujqA1DpZkVBVKLIJ2xeIRdoanXtb4QAq1eAGNZKQcdQXOWEPzBNXBPx4fG
         OT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786885408; x=1787490208;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/lX86K+JZrDFDK9uTD1J74KGfHX5SO2ORotkiNNQPo=;
        b=lA4qjnxULNljJX43Us1FdrgjxCHQ6WOFkdw9xHzTz+fQ+ivHwjaAkkHMHvyB0J6zNd
         T2T1ms7Arcdh1HHzCx3aHeAL7h60Klfh+HdBt5noECZyxF030tHEd9jQQNmiBLxuYxVw
         bnAbjMAKRyHHdb+L1DFTTs3hM0XWlz48eD4AQqZnlteHHgefj2fDRC07IdTMIX9IBGg6
         yptEKbV7654pV6YUSSrimVx0Z4UO9USBAovrYfxaWlWhOJonmwfbHEyKTz2vsyyDDV1N
         /0HCVawGJRHho2ZsnSmuFMatKL1rmo4Mx9bpmObOnr2rC2EjcxDLoEhVtbe1kaZhDBt2
         1CXg==
X-Forwarded-Encrypted: i=1; AHgh+Rqtx1UfCKI9yCIqrrWH8gc6z5m2KSFTnXunrEqZ1HMQPdz1XwPxgibtd3+iBU7tbEf3yoXlyg7CkyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV0YTmuOc+mqCr/E9BhE6HP0fX/9Tpa1yVkA965TRgyJVZuetz
	wmUktFXBTnSvlawE5C2NurANEQaKT/NF831DBeGi/Ipxn/SEopNRaZXimDn+54LmDYs=
X-Gm-Gg: AR+sD114tR2EyOU9nz4GPleoKP13oNPeHsHvtQht6+CKArSzf6BQ6de4AXxQ3Ef+uZG
	lMg+3U+wu3hARRdcvZVfjJ/2fTINKV5WUxK68aTZQWAf7AGu+h2nr3ExXEaFWkkFFDXK0b8RTKC
	GYfW0YFD2iM8kF+vpccdYKLNeL02xpOq5qVQIm7ptM5zNHsnNBpbA1On9BFc1crs5cu7rDwBXem
	2FcaNE2if81GCQuTfTMhw8L7d285EGQkJPcGm0/VhNBZooe/HRQkTcUG+pY0K6/HaitUmo4bOzr
	rTJ3eOlqrDd32Rri5ixQBf5l1T1/cKA2CKiKNVp+Z9m5Q5S6L9UTjPP/gGyz6cF66Hhl9JfeNbz
	DR6cyGSmD9JF0eyraZnFYcCJjGvWyHLe/FqWOenEIRndCI5Hwh2PsdkmMdfpTz0w0PX3PIv6M3t
	0Gvjc18vaS8ZB0uH6omHDI6p2VjWIByCeOCgr9RNbx6tHm8fiCBOTb7JEJ8wmQOjZhfNYfZH71r
	6PROYSgrlXnhTpeYoR92trIUwR+uwjQCfzcVVmQIN9uUIf/PaWrdMdDqS/CKTx2BPNtfSRzmJEE
	PlLYdCudxeYNz3N0KItZ2S55CQc=
X-Received: by 2002:a17:90b:2891:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3933b8e1ec2mr20046699a91.11.1786885408051;
        Sun, 16 Aug 2026 06:03:28 -0700 (PDT)
Received: from ?IPV6:2804:1b3:a7c1:58d7:d9b5:d24f:e6d9:6e45? ([2804:1b3:a7c1:58d7:d9b5:d24f:e6d9:6e45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea2fe8f1sm26547469eec.23.2026.08.16.06.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 06:03:27 -0700 (PDT)
Message-ID: <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org>
Date: Sun, 16 Aug 2026 10:03:24 -0300
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org,
 libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
 <20260816121505.jyz3ynrb3rxlvq6h@pali>
Content-Language: en-US
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <20260816121505.jyz3ynrb3rxlvq6h@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16/08/26 09:15, Pali Rohár wrote:
> On Sunday 16 August 2026 13:54:24 Guillem Jover wrote:
>> Hi!
>>
>> I was just refreshing my mind about documentation around TIOCGWINSZ,
>> and noticed the weird <asm/termbits.h> and <asm/termios.h> usage in
>> various ioctl man pages.
>>
>> These originate from commit c023614536251bd6b47a0eab45ab3bcfd2ad9ec2,
>> where it states that the «struct termios» definitions in the
>> <termios.h> header are incompatible with the defined ioctl calls.
>>
>> This seems problematic, for one because the <asm/*> headers are Linux
>> specific, so they reduce portability for all these macros, even when
>> they do not rely or make use of «struct termios». For another because if
>> there is a problem in glibc with the interaction between «struct termios»
>> and the ioctl calls, then that should be fixed in glibc, instead of
>> adding these workarounds in the man pages.
>>
>> It seems the problem is that in glibc «struct termios» maps to the Linux
>> «struct termios2», but the macros for ioctls that use «struct termios»
>> do not match (for example TCGETS instead of TCGETS2)?
>>
>>
>> I think this should be fixed both in glibc, to make the definitions
>> coherent, and in man-pages to not use those Linux-only headers where
>> it is not necessary and then on a second stage to point back to the
>> portable headers once glibc has been fixed?
>>
>> Thanks,
>> Guillem
> 
> Hello! The main problem is that glibc has different API and ABI for
> termios functions and structures than the raw Linux syscalls.
> 
> And at the same time glibc does not provide API for all functionality
> which Linux syscall provides.
> 
> And POSIX, nor GNU does not provide functions / API for setting
> arbitrary baudrate on the tty device.

From NEWS:

 464 Version 2.42
 [...]
 481 * On Linux, the <termios.h> interface now supports arbitrary baud rates;
 482   speed_t is redefined to simply be the baud rate specified as an
 483   unsigned int, which matches the kernel interface.

> 
> So all this functionality and information in the manpage are Linux
> specific, they are not portable.
> 
> Therefore in this case it is necessary for Linux specific thing to use
> Linux-only headers.
> 
> When I was looking at it in the past, I had feeling that glibc cannot
> easily fix it because it would break existing glibc ABI and contract for
> all existing applications.

It turned out to be doable, speed_t was already an unsigned int, old binaries
and the legacy Bxxxx bit-pattern values remain accepted for compatibility.

The struct termios ABI was preserved (the kernel conversion happens inside
tcgetattr/tcsetattr).

There was one regression in the transition (BZ 33340, non-standard baud handling
of CIBAUD), fixed for 2.43 by 8d999a69936.

> 
> But once glibc provides API for setting the arbitrary baudrate on tty
> device, we can improve the manpages. But as this did not happened
> for 30 years (in past I saw that there were some attempts), I doubt that
> it would be in near future. It is not easy thing.

The incompatibility we have is glibc and kernel struct termios have different
layout, so mixing them is a recipe for trouble.

Kudos to H. Peter Anvin for this work.
