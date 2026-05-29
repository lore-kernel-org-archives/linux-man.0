Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE00376BF1
	for <linux-man@vger.kernel.org>; Fri, 29 May 2026 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780090706; cv=pass; b=s9NAdXOoZiZ/+2WRnTGUHaK6zenfrB+RSMHf/ibF/LVbLmUmLb7SCshJ3nLvEWR1CbRJKf4kxIXhljZLLHuiQgbQvBcDRy+CqAXsop9NCMEb8NhxceycJlEuPNgyhHjGeMpOF9b9p7F6i7IF3LwKCx55CIaB1wINbLPvOxIbeeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780090706; c=relaxed/simple;
	bh=8ZmyDBgWyn0w1p7LMue51akVQhiMgzd0DRPW3vstQhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tj0k8HrkDWK0bBKnGjoCnq+rviabDVKQMXrdXuzQ1xqRVFq/HQAmfNDuttjpURTpHgxIJ5F015/BtXSWS9qe66eei2T1Noo6S0fuh1egzZGBo5d587VTeztNzASMqQlSZQaRkbNFhyFQDtF+uokVttJy7eE+4TC2d3ihrbgOxr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2khV0LH; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o2khV0LH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so7654222a12.3
        for <linux-man@vger.kernel.org>; Fri, 29 May 2026 14:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780090704; cv=none;
        d=google.com; s=arc-20240605;
        b=I7ua2qm4h85hAdFf/kbGhgz2Q8qBEKsSEe8U7OooblxFHvg5DegJvVJOq7eXQszJkL
         15/do/s7IhRhwYfzUb0zZfBLTk0vAUllsAK9e6kAI3Fd372xGquB9Y/7aEMuqp9+FApR
         z/fjnZo3LvpAL3zHyQv+vcnz21OVI4DLDHYD47ob/uncIkxW6x66ZmMiSc4x5WsJ/yn6
         AcyPVpm+lcFmS42EEgBroph29HryC0AR2hGsciGl6JuQqcde9QF7CxlhINokT2UKEXaH
         K4TlFjZWO6/0+ZiQkB48t8J5e/ucyaQtwPFDzo6bGA2h7JIuECyzhls1xos70MwfUqHA
         ohfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DbBtnQB2xzOUBn9v78yWFAqjuautwv1sgcJptcZKuyQ=;
        fh=bXbVw1eKLsk5rymDO9Vl3c650sMF7T8Rki3ARoq3Qms=;
        b=P3/UXMKkfAEPeDjAVhTQkuWOy1jG5SXb+S+5qxr+5JSwVDgap0CxZMSpHmM9emtWFW
         nn7UY+E4pbSZK14tMeVA8k2MizTEelnuJKzDaSrRmuwGRbaIef6ZmtxYTvgW/q2RHQeW
         QuoQNCcN80lXaX6z+xPr/hOY3lNBwxzM/dpuvPDKA1ZiYspHQCp06wbrt/XYbUoX6s/v
         SBYCbGevo8azozBc96dQm1vXsdxMNMfPrE4QsGF69bYXsgb2c3dvvFMtJv5yCY1N1zuC
         O6PZ97XqLtxeHBmRXACln4CCYVJ3+QntuVfVcJ4yipNlG0Rwas1Z/oav69aT+3BVs9+H
         RSqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780090704; x=1780695504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbBtnQB2xzOUBn9v78yWFAqjuautwv1sgcJptcZKuyQ=;
        b=o2khV0LHjLPL8flsSk+GOQCiBAVjckJgYK5nF9E8pfG38BoWmZOZzy2McCTbsrzij8
         BppYdBuVZCJ9UuCxAc89v1q3ZsR4VwMOzFdw6J5x6qKHpnOMmQ69sp5g/OsXQREMp8Ao
         NJi41dxHDdnTga5PE8y4fWdkDPwO9ycLoLVSZBRXVJq/vZUH5Um8njycKYRhBWtDGt3y
         NlOAXVQGu0MR4YK6XJ5KWeqIbZtD6n7qgN/PE+uL8nQaJzh3fuHwbwGk3olnmJaT8VJX
         3TZ/I8nVicZjGtQzRKo04Wlbfy7S14a09cMkPJaKw9E/gLkrp8Pi5pov454Tr34V3MAM
         X+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780090704; x=1780695504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DbBtnQB2xzOUBn9v78yWFAqjuautwv1sgcJptcZKuyQ=;
        b=d+1vOC/unCXwjt4lLUBOHDzJYgY4ylL2sBWsAzjK83RqiqcAsKvEqaOn9oXr5bdtOP
         mSgk47WofCHegUBpFvzzKZmVmIcCp89QjzIP9rT6pwbSv06V83JxmzkeDNHmHHi7I+9M
         T+/no7jDgChdmzVnSUvUUVj4r/yqK+neAiZjmq1g2kxu+KdddpJMQFqS8+puGRcMmcOe
         CdW7/y/jJ16wRM83WSvba1yzpUGFifMx+PQ1KP574zwKmQV5wsIqCJqGYMKoGCZLL62A
         RI/rXkmbhnz/EtRMDRidkQ89uKZSHPdJdbLiy/p/HsuMDvf+wz/c09p+nPCa3tNNfZfG
         4hxw==
X-Forwarded-Encrypted: i=1; AFNElJ8PYkKyFJyx/Jfw3sTbBvsJxWJW2pRb3MctLNn7zLelwHXajQkMUdKKAg7fVyMOgQ4qdK5prTbqAPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcKOk9uD/NyP8kJ0rf0t02/LiI1k7qzcv7ll9t3zifmgBpZkU9
	bJ4GvPQsxkepOCFUBO3FgROzVxcnCe+US9HmiPOolUcRltBEPp++O4Y7jKErlpgrF8Houi9Bl1Y
	gl8njpkFLRf3iPA3MHS8xvzaDrEZ9XLXtjknEJ1A=
X-Gm-Gg: Acq92OGNCZcZFOTSn6JjSRb4fcOHl6QKtE1IapEbSC50dFWDQTv/kFDy50MJZoFzsGF
	CEDiDMI/KMQ/VfbU1a5sVzRTYI0Xn6WfL4wRYbhH09rfqZFaB0NmEkY18VJCW9KyT3tBnb84o0o
	yCqnKFKP96X3jh2rpY+54Q3VhmiNaIpk/YU5/qfchEgM5ju5td2/X/5s/vzsQPIJ8EG0BpdK6qY
	wLkQ54DsPYv6ZA/KLzEkrd5SryG5/x0HpGIcw0gtxxmn5H3HTFB9a8ckUD1omMIBAvEhzwmycdo
	98XrGkTzm4R/NRdJf4AjSD9VqLULtG/k37pKPggnkL8Ww1XMeDNb
X-Received: by 2002:a05:6402:2421:b0:689:816a:5367 with SMTP id
 4fb4d7f45d1cf-68c8651d431mr852723a12.0.1780090703463; Fri, 29 May 2026
 14:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-fan-mark-cwd-v1-1-cdfb3b5b6d7c@google.com>
In-Reply-To: <20260529-fan-mark-cwd-v1-1-cdfb3b5b6d7c@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 29 May 2026 23:38:11 +0200
X-Gm-Features: AVHnY4JFsXcZubiMQSUmo9QsFAAHHbp9HPon2aKRoIHyShz9SrjY_eo4bSTU74A
Message-ID: <CAOQ4uxiHU5xK=_FsOBkkB0go9ACBb2fYcdVE6T2o=MYDcxaiaQ@mail.gmail.com>
Subject: Re: [PATCH] man/man2/fanotify_mark.2: AT_FDCWD plus NULL path doesn't work
To: Jann Horn <jannh@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, Jan Kara <jack@suse.cz>, Matthew Bobrowski <repnop@google.com>, 
	linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 7:27=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> The fanotify_mark.2 manpage claims that AT_FDCWD works with a NULL path,
> but there is no kernel code for that - in fanotify_find_path(), in the
> `if (filename =3D=3D NULL)` block, the fd is only used for a normal FD
> lookup.
>
> This was also already the case when this manpage was written back in
> 2014, so remove the bogus documentation.
>
> Fixes: c200b422d ("fanotify_mark.2: New page documenting fanotify_mark(2)=
")
> Signed-off-by: Jann Horn <jannh@google.com>

Hah,  never noticed this.
Apparently, hallucinations already existed in 2014 :D

Acked-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  man/man2/fanotify_mark.2 | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/man/man2/fanotify_mark.2 b/man/man2/fanotify_mark.2
> index e561ffd21..a3b77537c 100644
> --- a/man/man2/fanotify_mark.2
> +++ b/man/man2/fanotify_mark.2
> @@ -560,14 +560,6 @@ defines the filesystem object to be marked.
>  .IP \[bu]
>  If
>  .I path
> -is NULL, and
> -.I dirfd
> -takes the special value
> -.BR AT_FDCWD ,
> -the current working directory is to be marked.
> -.IP \[bu]
> -If
> -.I path
>  is absolute, it defines the filesystem object to be marked, and
>  .I dirfd
>  is ignored.
>
> ---
> base-commit: 9db8ca91f920b9aba40ed68de6b8da0ca9dbefaa
> change-id: 20260529-fan-mark-cwd-1c760106eff9
>
> Best regards,
> --
> Jann Horn <jannh@google.com>
>
