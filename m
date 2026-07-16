Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F2538D3F7
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231021; cv=pass; b=uMdk0uHzlp9brOTq2IY2aZxgRlTXfqSsQk9HxkLcZfaUTerjIMngtVFlJteLZH1jtydp+atvOsa8tHblJwj/qzROrJACg1I8PR6lvoLROq3/IIwbjUOMY/4pzvBzeNn43iVIciWvSbtJZ9mKcQYP2KkPEAYcFeMXp+nZj4vpiwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231021; c=relaxed/simple;
	bh=CuyDo6trYLTCnN82FwILgPnKoYcqaO44Tnxjj0cqObo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jN4eitoqN61H0YVoDFCf3CZjNsykWq40/SL5FGsLdAX9L/lRZ3HL2qO66zl3senhJdo7YAgCiWWnOedmFM0QmXMxBOEeIDwNcq2TIHdHZRHqfCqvv0ibPBRf1jeU6O69hQuyG3LKNis9V6SFoJgsAwHuFwsqihqTAddNzVZ/Yyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dartmouth.edu; spf=pass smtp.mailfrom=dartmouth.edu; dkim=pass (2048-bit key) header.d=dartmouth.edu header.i=@dartmouth.edu header.b=a3kxf330; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dartmouth.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dartmouth.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dartmouth.edu header.i=@dartmouth.edu header.b="a3kxf330"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so5318887e87.0
        for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 12:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784231018; cv=none;
        d=google.com; s=arc-20260327;
        b=ZKf9KrxTTcMMbzwmHEzy3OEb2eR1TFi/j18vn+RHzsTz8eZDvERaNTLjpzxZQo5Ev+
         Vc6aA18kK9bKNjgEyQO8x0eMR4MZb10mSFCzlFB4+xvHXQ5G5Bh5dLvg9thcaf5JZFM5
         meOGZrJ0lRnUS1hnIhzA/kqBmedLU/uSHVwg7243a77vcdIjTNh40jISd6DEqHrOn3Gm
         01e1Ixfmv4EQYN+hQ9ZqBMGcN7qhmpE+F8uCwY0WaEBFKoY1jjhP5opmTE1HTpZS7YMf
         8yiClZmRZktdfMF926JW/ZRSEDrsCpVYkFKBWqu6jUGsgD7LCvsmMgr4SPsHTHCFXKx6
         f5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=93UXCAhVAPsEtmyKFRsIG+axOKwc8BJ7oQ8SSqBBPxU=;
        fh=kTbk4pccRQ7ywKItoF6eFeVMUIye+84NI5zbIP4rQ9Q=;
        b=Ov/SdjY4VDKXHO6j7LcqGpqeNcskPLMIgXuEO1rmQhKqUY9XgGh1WjQYcaUhmEmQD+
         BYpMfz27H2uDMNQOMld4IXsF6CcwY1wF6HblGGMTtFlkzYgdQz8vZfQN3yf3s/uPgEGx
         nL2UQRyc6e9fJsk3EdWqKmi39hcRjQ4IbWY7aG+9uoznqriSo1HGicM2bw/Idn2hpscf
         vpS8W2uCPlIWjKh+RmA3gfhwRpLHqsG8LZ11NFLRrrdqJrO3ks370yzg9RVw8tmKFKcQ
         fv/yIL2+SBhV/gaBQVXQxAMGERox9YysyhOhUMgE94HfARARkBiQPletr6bGp+gS7oiR
         +LQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dartmouth.edu; s=google1; t=1784231018; x=1784835818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=93UXCAhVAPsEtmyKFRsIG+axOKwc8BJ7oQ8SSqBBPxU=;
        b=a3kxf330GmfsUjLTkAyghWQtBqsJAEbYgJI3Qvr1RDsCECp9ziRKHLMSgfTGwhn8eR
         5rprbENU95BYSQSKPJGXTAJn9RNvQBSi60rfJ/97bBlBwgO2pxdw+bvqvRlccBJzJWfY
         EC1qrsjZAcVTsvEG1OiV8PcPlM0L41+Lr+VC3R39+BhsMFmCwmaAW3snrKcgB7913YSD
         hGndXHzrJMVXizmxsABI0wU1CttwSkRvvna+tJrwmOWSMA7h38Iw54RxJQfn1D1jg2n4
         2gKARsGCcKF4OiTgpZGHbGiUiHfSKAUR7BGQSiSYRV8t1SjPZ2v06hBZPM7sp0KJ39n0
         bx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784231018; x=1784835818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93UXCAhVAPsEtmyKFRsIG+axOKwc8BJ7oQ8SSqBBPxU=;
        b=SIkqpYxoFiG/sfqaLSWf2wBfB7G7Q0QnnVGVVOlpAYOmnE+Qh+64F3mYdpxl70lFm0
         VqTEVQr3HuYg6TUVB+f9NBFujomliJyWS3m/v1ou0b57I+lPZfHOO086gMhSb/xgG6zz
         mowSC0Yc+0dWyYGpK4qMDK0pkZmt81KCDEwWIYFc6cyf6SoOpTytwG9QNXcYzJX5LJsC
         ub+TL2/yZjcWRjfSnsX1tNQ+rL5ZZ97IzFf8KIklGN7iK5OO+7xZ0UTBZKb9lh9G/T5y
         QFLxzOxRBqnZv8Y2kYSXsiXAEcwXetIf0StpBM4SJDBqOOB2WK0M+m4dbSNoKtvcZbUr
         755Q==
X-Gm-Message-State: AOJu0YwkPkpPVk6bP3De4Dd3rPw27yLxmygKixrgLyxulcwbJC4gQXYw
	Su82LaFPeiEnzfHWuqBdF56naJLAOgOWSkYU1gnGx8DFMib7FHXzA3Y1supmXPyLdDCZjcEFTPp
	yKziYX/Y7cxAAzQDhh4eCv5rn3rHOOUYk1ENIxe9MwA==
X-Gm-Gg: AfdE7cmmSMPMZj3aFKTuWN/iQ/q1lit1IO8ZsDfNDnjqCZNgw5No9BDPcr9l8GUK9SO
	Hpyv8PJkS0rDYl0eJ6IGlzH02hiWlHFif7lI0++hiqmgyf8NEC5i1Z1LJLXbw9sZLDwa5kHeX8Z
	GF+QTgr+ZXvAZew9itrUPhs5e+PJpaR5M30c82m7IkqkqOWmoPhVOyTjPwvUOSWAG0lVC2+8Pvb
	pY6e7UynZCvrUHkAZ1QNeh+IAGvGVy0L/eMWqAk5jvu4ApPwYa+er95KNQa64DxLK+f4pA/rbih
	NIX4bgtriIGcJpXSIVidWs+LgwZ+bxVabKLI82XaC02y4IY5BzKMKttN9AcrtNTmnPfAiASUeZx
	NvMCqFxvJ6MEqgTEE798C/db1TPNq3z+Tc/E=
X-Received: by 2002:a05:6512:2343:b0:5ae:c239:f052 with SMTP id
 2adb3069b0e04-5b159b910c1mr2806964e87.62.1784231017833; Thu, 16 Jul 2026
 12:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan> <CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>
In-Reply-To: <CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>
From: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Date: Thu, 16 Jul 2026 15:43:21 -0400
X-Gm-Features: AUfX_mxW6dVoomFsvUD_QYmzrt2VT6z8quUdRLUA7zTKSaO_vDqBxI8R_9z3P8o
Message-ID: <CAKH6PiVuxFAc1f12SFXwaaDshHGGYOXTjWa=ySNA8H1SBJ2Gkw@mail.gmail.com>
Subject: Re: syntax of options in man1
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I think there should be a separation between an introduction to the
> entire system (maybe this could be intro(0)), and an introduction to the
> first section of the manual (intro(1)).

I agree. In the early days, at least, there was such a section, called
"getting started". I like the idea of calling it intro(0). The very name
suggests that there are more intro(.) pages. Elegant!

Doug


On Thu, Jul 16, 2026 at 1:19=E2=80=AFPM Douglas McIlroy
<douglas.mcilroy@dartmouth.edu> wrote:
>
> > I think there should be a separation between an introduction to the
> > entire system (maybe this could be intro(0)), and an introduction to th=
e
> > first section of the manual (intro(1)).
>
> I agree. In the early days, at least, there was such a section, called
> "getting started". I like the idea of calling it intro(0). The very name
> suggests that there are more intro(.) pages. Elegant!
>
> Doug
>
>
>
> Doug
>
> On Thu, Jul 16, 2026 at 10:45=E2=80=AFAM Alejandro Colomar <alx@kernel.or=
g> wrote:
>>
>> [Added linux-man@]
>>
>> Hi Doug,
>>
>> On 2026-07-16T09:46:25-0400, Douglas McIlroy wrote:
>> > Here's a typical option heading (from tail(1))
>> >   *    -n, --lines=3D[+]NUM*
>> >
>> > It is tempting to assume (incorrectly) that the short alternative is -=
n=3D4.
>> > As far as I can tell, the convention that "=3D" is part of only the lo=
ng
>> > alternative is described nowhere.
>>
>> Agree.  I've had that concern for a long time.
>>
>> > I think the description belongs in intro(1).
>>
>> Agree.
>>
>> > Incidentally, the actual content of intro(1) is absurdly bloated and m=
uch
>> > of it is way off topic.
>>
>> Agree.
>>
>> I think there should be a separation between an introduction to the
>> entire system (maybe this could be intro(0)), and an introduction to the
>> first section of the manual (intro(1)).
>>
>> What do you think?
>>
>>
>> Have a lovely day!
>> Alex
>>
>> > Doug
>>
>> --
>> <https://www.alejandro-colomar.es>
