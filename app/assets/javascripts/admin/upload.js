$(document).ready(function() {
    var body = $('body')
    //upload

    if($('#upload').length > 0){
        var client = new OSS.Wrapper({
            region: 'oss-cn-beijing',
            //云账号AccessKey有所有API访问权限，建议遵循阿里云安全最佳实践，创建并使用STS方式来进行API访问
            accessKeyId: gon.aliyun_access_key_id,
            accessKeySecret: gon.aliyun_access_key_secret,
            // stsToken: '<Your securityToken(STS)>',
            bucket: 'pcyc',
            secure: true
        });

        body.on('change', '#upload', function (e) {
            console.log("in upload......")
            var file = e.target.files[0];
            console.log(file)
            var storeAs = guid();
            console.log(file.name + ' => ' + storeAs);
            client.multipartUpload(storeAs, file).then(function (result) {
                console.log(result);
                image_filename = result['name'];
                if($('#upload').is('[multiple]')){
                    process_multi_image(image_filename)
                }else{
                    process_single_image(image_filename)
                }
            }).catch(function (err) {
                console.log(err);
            });
        });
    }
    //.upload


    var process_single_image = function (filename) {
        $('#image_url').val(filename);
    };
    var process_multi_image = function (filename) {
        var image_url = "http://pcyc.oss-cn-beijing.aliyuncs.com/" + filename
        if ($('div').hasClass('multiple_picture')) {
            $('.multiple_picture').find('.clear-fix').append(
                '<li> <img src="' + image_url + '?x-oss-process=image/resize,w_150" alt="图片" > ' +
                '<input type="hidden" name="' + $('.multiple_picture').attr('name_value') + '" value="' + filename + '"/> ' +
                '<a class="hit_ajax delete">删除</a> </li>'
            );
        }
        $('#multi_image_upload').children('input').trigger("validate");

        var maxNumber = $('#max-picture-number').attr('max-picture-number') || 10
        var currentNumber = $('#max-picture-number input').length || 0
        if (currentNumber >= maxNumber) {
            $('#multi_image_upload').hide();
        } else {
            $('#multi_image_upload').text('继续上传');
        }
    };


    body.on('click', '.hit_ajax.delete',function(){
        var li_ele = $(this);
        li_ele.parent().remove();
    });


    //生成随机数
    function guid() {
        return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
            s4() + '-' + s4() + s4() + s4();
    }

    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
    }
})