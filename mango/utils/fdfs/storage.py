from django.core.files.storage import Storage
from fdfs_client.client import Fdfs_client
from mango import settings


# 文件存储类
class FDFSStorage(Storage):
    """   fast dfs 文件存储类   """
    def __init__(self, client_conf=None, base_url=None):
        """   初始化   """
        if client_conf is None:
            client_conf = settings.FDFS_CLIENT_CONF
        self.client_conf = client_conf

        if base_url is None:
            base_url = settings.FDFS_URL
        self.base_url = base_url

    def _open(self, name, mode='rb'):
        """   打开文件时使用   """
        # rb，是以二进制的形式读取文件
        pass

    def _save(self, name, content):
        """   保存文件时使用   """
        # name: 你选择上传文件你的名字
        # content： 包含你上传文件内容的File对象

        # 创建一个Fdfs_client对象
        client = Fdfs_client(self.client_conf)

        # 上传文件到FastDFS系统中
        res = client.upload_by_buffer(content.read())

        if res.get('Status') != "Upload successed.":
            # 上传失败
            raise Exception(res)

        # 获取返回的文件ID
        filename = res.get("Remote file_id")

        return filename

    def exists(self, name):
        """   提供的名称可以用于新文件，也可以理解成用于上传的文件进行使用   """
        return False

    def url(self, name):
        """   上传成功以后，返回上传的文件的路径   """
        return self.base_url + name
