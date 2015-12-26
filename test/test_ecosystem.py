import unittest
import os
import sys
from pprint import pprint

LAST_TOOL = 'vred-pro2015'
NO_TOOLS = 44
MAYA_VARIABLE_LIST = [
     'MAYA_ver',
     'MAYA_MODULE_PATH',
     'NIM_CONNECTOR',
     'RS_MAYA_PY_site_packages',
     'PATH',
     'RS_BASE_PY_site_packages',
     'RS_TOOLS_MEL_OVERRIDES',
     'MI_CUSTOM_SHADER_PATH',
     'RS_TOOLS_MEL_STARTUP',
     'RS_IACTIVE_TOOLS',
     'RS_DEPARTMENT',
     'MAYA_SCRIPT_PATH',
     'PYTHON_version',
     'MAYA_LOCATION',
     'PYTHONPATH',
     'MAYA_PRESETS_PATH',
     'DEADLINE_STANDALONE',
     'DYLD_LIBRARY_PATH',
     'RS_STUDIO_ICONS',
     'RS_LAUNCHER_MAYA',
     'MAYA_PLUG_IN_PATH',
     'PYTHONHOME',
     'RS_TOOLS_SHELF'
]

TEST_GET_TOOL = ['maya2015', 'mtoa1.2.5','base', 'stable']
TEST_GET_ENV = '''#Environment created via Ecosystem
  setenv MAYA_version: 2015
  setenv RS_SW_BASE: S:/dev_area/DEPLOYMENT
  setenv RS_DEPLOY: ${RS_SW_BASE}/Production/Deploy
  setenv RS_STUDIO_envs: ${RS_DEPLOY}/studio-envs
  setenv MTOA_VERSION: 1.2.5.0
  setenv MTOA: ${RS_STUDIO_envs}/solidangle/mtoa/${MTOA_VERSION}-windows64/${MAYA_version}
  setenv ARNOLD_PLUGIN_PATH: ${MTOA}/shaders
  setenv ARNOLD_VERSION: 4.2.11.3
  setenv CHANNEL: stable
  setenv DEADLINE_STANDALONE: ${RS_STUDIO_envs}/deadline/Deadline7
  setenv MAYA_LOCATION: C:/Program Files/Autodesk/Maya${MAYA_version}
  setenv MAYA_MODULE_PATH: ${RS_STUDIO_envs}/maya/modules
  setenv MAYA_PLUG_IN_PATH: ${MAYA_MODULE_PATH}/${MAYA_version}-windows;${MTOA}/plug-ins
  setenv MAYA_PRESETS_PATH: ${RS_STUDIO_envs}/maya/presets
  setenv MAYA_RENDER_DESC_PATH: ${MTOA}
  setenv STUDIO_version: v0002
  setenv RS_DEPLOY_studio: ${RS_DEPLOY}/studio/${STUDIO_version}
  setenv RS_TOOLS_MEL: ${RS_DEPLOY_studio}/tools/mel
  setenv MAYA_SCRIPT_PATH: ${RS_TOOLS_MEL}/scripts
  setenv MI_CUSTOM_SHADER_PATH: ${RS_STUDIO_envs}/maya/${MAYA_version}/mentalray/win64/include
  setenv MTOA_EXTENSIONS: ${MTOA}/extensions
  setenv MTOA_EXTENSIONS_PATH: ${MTOA}/extensions
  setenv NIM_CONNECTOR: ${RS_STUDIO_envs}/NIM/nim_connector_v1-0-0-150810
  setenv OSNAME: Windows
  setenv PYTHONHOME: ${MAYA_LOCATION}/Python
  setenv PATH: ${RS_DEPLOY}/lib;;${MAYA_LOCATION}/bin;${PYTHONHOME}/Scripts;${MAYA_LOCATION}/Python/Lib/site-packages/pymel/tools/bin;C:/Program Files/Common Files/Autodesk Shared/;C:/Program Files (x86)/Autodesk/Backburner;;${MTOA}/bin;${PATH}
  setenv RS_PY_TOOLS: ${RS_DEPLOY_studio}/tools/python;${RS_DEPLOY_studio}/python
  setenv RS_DEPARTMENT: POST
  setenv PYTHON_version: 2.7.9
  setenv RS_MAYA_PY_site_packages: ${RS_STUDIO_envs}/maya/${MAYA_version}/python/py${PYTHON_version}-win64/lib/site-packages
  setenv RS_BASE_PY_site_packages: ${RS_STUDIO_envs}/python/py${PYTHON_version}-win64/Lib/site-packages;
  setenv RS_LAUNCHER: ${RS_DEPLOY_studio}/launcher
  setenv RS_LAUNCHER_MAYA: ${RS_LAUNCHER}/RS/launch/maya
  setenv PYTHONPATH: ${RS_BASE_PY_site_packages};${RS_MAYA_PY_site_packages};${RS_PY_TOOLS};${RS_LAUNCHER};${RS_LAUNCHER_MAYA}/${RS_DEPARTMENT};${DEADLINE_STANDALONE}/python;${NIM_CONNECTOR};${MTOA}/scripts
  setenv RS_IACTIVE_TOOLS: I:/tools
  setenv RS_STUDIO_ICONS: ${RS_DEPLOY}/Resources
  setenv RS_TOOLS_MEL_OVERRIDES: ${MAYA_SCRIPT_PATH}/overrides
  setenv RS_TOOLS_MEL_STARTUP: ${MAYA_SCRIPT_PATH}/startup
  setenv RS_TOOLS_SHELF: ${RS_TOOLS_MEL}/shelves
  setenv RS_USER_DEV_HOME: S:/dev_area/users/${USERNAME}
  setenv RS_USER_HOME: T:/_COMMON_SHARE/Freelancers/${USERNAME}
'''

ECO_ROOT = os.environ.get('ECO_ROOT') or os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
ECO_ENV  = os.path.join(ECO_ROOT, 'Ecosystem-Env')

from ecosystem import ValueWrapper, Variable, Tool, Environment, list_available_tools, main


class ValueWrapperTester(unittest.TestCase):

    # def setUp(self):
    #     self.value_wrapper_obj = ValueWrapper()
    #
    # def tearDown(self):
    #     pass

    def test__current_os(self):
        value_wrapper_obj = ValueWrapper('foo')
        os_list = ['darwin', 'linux', 'windows']
        self.assertTrue(value_wrapper_obj._current_os in os_list)

    def test_value_dict_os(self):
        dict_value = {'darwin': '/some/path',
                      'linux': '/some/path',
                      'windows': '/some/path', }
        value_wrapper_obj = ValueWrapper(dict_value)
        self.assertEqual(value_wrapper_obj.value, '/some/path')

    def test_value_dict_common(self):
        dict_value = {'common': '/some/path'}
        value_wrapper_obj = ValueWrapper(dict_value)
        self.assertEqual(value_wrapper_obj.value, '/some/path')
        dict_value = {'common': '/some/path',
                      'darwin': '/other/path',
                      'linux': '/other/path',
                      'windows': '/other/path'}
        value_wrapper_obj = ValueWrapper(dict_value)
        self.assertEqual(value_wrapper_obj.value, '/other/path')

    def test_strict_value(self):
        dict_value = {'common': '/some/path', 'strict': True}
        value_wrapper_obj = ValueWrapper(dict_value)
        self.assertEqual(value_wrapper_obj.strict_value, True)
        dict_value = {'common': '/some/path'}
        value_wrapper_obj = ValueWrapper(dict_value)
        self.assertEqual(value_wrapper_obj.strict_value, False)

    def test_absolute_value(self):
        dict_value = {'common': '/some/path', 'abs': ['windows', 'linux', 'darwin']}
        value_wrapper_obj = ValueWrapper(dict_value)
        self.assertEqual(value_wrapper_obj.absolute_value, True)
        dict_value = {'common': '/some/path', 'abs': 'foo'}
        value_wrapper_obj = ValueWrapper(dict_value)
        self.assertEqual(value_wrapper_obj.absolute_value, 'foo')
        dict_value = {'common': '/some/path'}
        value_wrapper_obj = ValueWrapper(dict_value)
        self.assertEqual(value_wrapper_obj.absolute_value, False)


class VariableTester(unittest.TestCase):

    def _test_append_value(self, variable, value,
                           dependents=None,
                           values=None,
                           dependencies=None,
                           strict=False,
                           absolute=False):
        variable_obj = Variable(variable)
        variable_obj.append_value(value)
        self.assertEqual(variable_obj.dependents, dependents or [])
        self.assertEqual(variable_obj._values, values or [])
        self.assertEqual(variable_obj.dependencies, dependencies or [])
        self.assertEqual(variable_obj.strict, strict)
        self.assertEqual(variable_obj.absolute, absolute)

    def test_append_value_string(self):
        self._test_append_value('MAYA_VERSION', '2015', values=['2015'])

    def test_append_value_dict(self):
        dict_value = {'darwin': '/some/path',
                      'linux': '/some/path',
                      'windows': '/some/path', }
        self._test_append_value('MAYA_LOCATION', dict_value, values=['/some/path'])
        dict_value = {'foo': '/other/path', }
        self._test_append_value('MAYA_LOCATION', dict_value, values=[])

    def test_append_value_dependency(self):
        self._test_append_value('PATH', '/some/path/${MAYA_VERSION}',
                                values=['/some/path/${MAYA_VERSION}'],
                                dependencies=['MAYA_VERSION'])

    def test_append_value_common(self):
        dict_value = {'common': '/some/path'}
        self._test_append_value('MAYA_LOCATION', dict_value, values=['/some/path'])
        dict_value = {'common': '/some/path',
                      'darwin': '/other/path',
                      'linux': '/other/path',
                      'windows': '/other/path'}
        self._test_append_value('MAYA_LOCATION', dict_value, values=['/other/path'])

    def test_append_value_abs(self):
        dict_value = {'common': '/some/path', 'abs': ['windows', 'linux', 'darwin']}
        self._test_append_value('MAYA_LOCATION', dict_value, values=['/some/path'], absolute=True)

    def test_append_value_strict(self):
        dict_value = {'common': '/some/path', 'strict': True}
        self._test_append_value('MAYA_LOCATION', dict_value, values=['/some/path'],
                                strict=True)

    def test_list_dependencies(self):
        self.variable_obj = Variable('MAYA_LOCATION')
        variable = '/some/path/${MAYA_VERSION}'
        self.assertEqual(self.variable_obj.list_dependencies(variable), ['MAYA_VERSION'])
        self.assertEqual(self.variable_obj.list_dependencies('/some/path'), [])

    def test_has_value(self):
        self.variable_obj = Variable('MAYA_LOCATION')
        self.assertFalse(self.variable_obj.has_value())
        self.variable_obj.append_value('/some/path')
        self.assertTrue(self.variable_obj.has_value())

    def test_get_env(self):
        self.variable_obj = Variable('MAYA_LOCATION')
        self.variable_obj.append_value('/some/path')
        self.assertEqual(self.variable_obj.envValues, '/some/path')


class ToolTesterMaya(unittest.TestCase):

    def setUp(self):
        self.environ = os.environ.copy()
        os.environ['ECO_ENV'] = os.path.join(ECO_ENV, 'env')
        self.env_file = 'maya_2015.env'
        self.tool = 'maya'
        self.version = '2015'
        self.platforms = ['windows', 'linux', 'darwin']
        self.requirements = ['base']
        self.filename = os.path.join(ECO_ENV, 'env', self.env_file)
        self.tool_obj = Tool(self.filename)
#         self.maxDiff = None

    def tearDown(self):
        os.environ = self.environ

    def test_tool(self):
        self.assertEqual(self.tool_obj.tool, self.tool)

    def test_version(self):
        self.assertEqual(self.tool_obj.version, self.version)

    def test_platforms(self):
        self.assertEqual(self.tool_obj.platforms, self.platforms)

    def test_requirements(self):
        self.assertEqual(self.tool_obj.requirements, self.requirements)

    def test_get_vars(self):
        class Foo():
            def __init__(self):
                self.tools = {}
                self.variables = {}
        foo_obj = Foo()
        self.tool_obj.get_vars(foo_obj)
        pprint(foo_obj.variables.keys())
        self.assertEqual(foo_obj.variables.keys(), MAYA_VARIABLE_LIST)

    def test_platform_supported(self):
        self.assertTrue(self.tool_obj.platform_supported, True)

    # def test_definesVariable(self):
    #     self.assertTrue(self.tool_obj.definesVariable('foo'), False)


class EnvironmentTester(unittest.TestCase):

    def setUp(self):
        self.environ = os.environ.copy()
        os.environ['ECO_ENV'] = os.path.join(ECO_ENV, 'env')
        os.environ['RS_SW_BASE'] = os.path.join(ECO_ROOT, 'test', 'pg_sw_base')
        self.tools = TEST_GET_TOOL
        self.environment_obj = Environment(self.tools)

    def tearDown(self):
        os.environ = self.environ

    def test_get_env(self):
        pprint(self.environment_obj.get_env())
        self.assertEqual(self.environment_obj.get_env(), TEST_GET_ENV)


class ListAvailableToolsTester(unittest.TestCase):

    def setUp(self):
        self.environ = os.environ.copy()
        os.environ['ECO_ENV'] = os.path.join(ECO_ENV, 'env')
        self.last_tool = LAST_TOOL
        self.no_tools  = NO_TOOLS

    def tearDown(self):
        os.environ = self.environ

    def test_list_available_tools(self):
        available_tools = list_available_tools()
        self.assertEqual(available_tools[-1], self.last_tool)
        self.assertEqual(len(available_tools), self.no_tools)


# class MainTester(unittest.TestCase):
#
#     def setUp(self):
#         self.environ = os.environ.copy()
#         os.environ['ECO_ENV'] = os.path.join(ECO_ROOT, 'env')
#
#     def tearDown(self):
#         os.environ = self.environ


if __name__ == '__main__':
    unittest.main()
